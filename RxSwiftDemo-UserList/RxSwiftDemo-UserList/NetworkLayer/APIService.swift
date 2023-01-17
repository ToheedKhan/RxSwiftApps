//
//  APIService.swift
//  RxSwiftDemo-UserList
//
//  Created by Toheed Jahan Khan on 17/01/23.
//

import Foundation
import RxCocoa
import RxSwift

protocol APIServiceProtocol {
    //returns an observable of type codable to map the received data.
     func callAPI<T: Codable>() -> Observable<T>
}

class APIService: APIServiceProtocol {
    let baseURL = URL(string: "https://reqres.in/api/users")!
    let session = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask? = nil
    
    func callAPI<T: Codable>() -> Observable<T> {
        //create an Observable of type T by using the create function which returns a Disposable.
        return Observable<T>.create { observer in
            self.dataTask = self.session.dataTask(with: self.baseURL, completionHandler: { (data, response, error ) in
                do {
                    //Once we receive the response, we try to decode it,
                    let model: UsersDataModel = try JSONDecoder().decode(UsersDataModel.self, from: data ?? Data())
                    
                    // if the decoding is successful, the observable emits the onNext event with the decoded data.
                    observer.onNext(model.data as! T)
                } catch let error {
                    //If the decoding ends up being erroneous, observer emits onError event with error as value.
                    observer.onError(error)
                }
                observer.onCompleted()
            })
            self.dataTask?.resume()
            return Disposables.create {
                self.dataTask?.cancel()
            }
        }
    }
}
