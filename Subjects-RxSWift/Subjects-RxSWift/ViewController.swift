//
//  ViewController.swift
//  Subjects-RxSWift
//
//  Created by Toheed on 03/02/23.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    let randomPhotoSubject = ReplaySubject<Data>.create(bufferSize: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        getRandomPhoto()
        
        randomPhotoSubject
            .subscribe(onNext: { (data) in
                print("1:", data)
            })
            .disposed(by: disposeBag)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.randomPhotoSubject
                .subscribe(onNext: { (data) in
                    print("2:", data)
                })
            .disposed(by: self.disposeBag)            
        }
    }
    /*
     As we can see, the ReplaySubject makes it easy to buffer data. It also eliminates the need for creating side properties to get a hold of previously emitted data, which makes our code more succinct and clearer to the reader.
     */

    func getRandomPhoto() {
        let url = URL(string: "https://source.unsplash.com/random")!
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { [weak self] (data, response, _) in
            
            guard let data = data, let response = response as? HTTPURLResponse,
                  (200..<300) ~= response.statusCode else {
                return
            }
            
            self?.randomPhotoSubject.onNext(data)
        }
        task.resume()
    }
}

