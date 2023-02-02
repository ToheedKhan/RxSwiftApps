//
//  ViewController.swift
//  GoodWeather
//
//  Created by Toheed on 02/02/23.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var cityNameTextField: UITextField!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //This will create request on every value change
//        self.cityNameTextField.rx.value
//            .subscribe(onNext: { city in
//
//                if let city = city {
//                    if city.isEmpty {
//                        self.displayWeather(nil)
//                    } else {
//                        self.fetchWeather(by: city)
//                    }
//                }
//
//            }).disposed(by: disposeBag)
        
        self.cityNameTextField.rx.controlEvent(.editingDidEndOnExit)
            .asObservable()
            .map { self.cityNameTextField.text }
            .subscribe(onNext: { city in
                //Don't need to use weak self as nobody is going to retain this controller
                if let city = city {
                    if city.isEmpty {
                        self.displayWeather(nil)
                    } else {
                        self.fetchWeather(by: city)
                    }
                }
                
            }).disposed(by: disposeBag)
    }
    
//    private func fetchWeather(by city: String) {
//
//        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
//              let url = URL.urlForWeatherAPI(city: cityEncoded) else {
//            return
//        }
//
//        let resource = Resource<WeatherResult>(url: url)
//
//       URLRequest.load(resource: resource)
//            .observe(on: MainScheduler.instance)
//            .catchAndReturn(WeatherResult.empty)
//            .subscribe(onNext: { result in
//                let weather = result.main
//                self.displayWeather(weather)
//            }).disposed(by: disposeBag)
//
//    }
    
    private func fetchWeather(by city: String) {

        guard let cityEncoded = city.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              let url = URL.urlForWeatherAPI(city: cityEncoded) else {
            return
        }

        let resource = Resource<WeatherResult>(url: url)
        
        //Binding - Way 1 using Binding observables
        
        /*
        let search = URLRequest.load(resource: resource)
            .observe(on: MainScheduler.instance)
            .catchAndReturn(WeatherResult.empty)

        search.map { "\($0.main.temp) ℉" }
            .bind(to: self.temperatureLabel.rx.text)
            .disposed(by: disposeBag)

        search.map { "\($0.main.humidity) 💦" }
            .bind(to: self.humidityLabel.rx.text)
            .disposed(by: disposeBag)
        */
        
        //Binding - Way 2 Using ControlProperty and Driver

//        let search = URLRequest.load(resource: resource)
//            .observe(on: MainScheduler.instance)
//            .asDriver(onErrorJustReturn: WeatherResult.empty)
        
        //Catching errors
        
        let search = URLRequest.load(resource: resource)
        .observeOn(MainScheduler.instance)
            .catchError { error in
                print(error.localizedDescription)
                return Observable.just(WeatherResult.empty)
            }.asDriver(onErrorJustReturn: WeatherResult.empty)

        search.map { "\($0.main.temp) ℉" }
            .drive(self.temperatureLabel.rx.text)
            .disposed(by: disposeBag)

        search.map { "\($0.main.humidity) 💦" }
            .drive(self.humidityLabel.rx.text)
            .disposed(by: disposeBag)

    }
    
    private func displayWeather(_ weather: Weather?) {
        
        if let weather = weather {
            self.temperatureLabel.text = "\(weather.temp) ℉"
            self.humidityLabel.text = "\(weather.humidity) 💦"
        } else {
            self.temperatureLabel.text = "🙈" //(command + ctrl+space)
            self.humidityLabel.text = "⦰"
        }
    }
}

