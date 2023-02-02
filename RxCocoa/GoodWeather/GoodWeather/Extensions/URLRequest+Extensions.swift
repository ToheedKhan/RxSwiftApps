//
//  URLRequest+Extensions.swift
//  GoodWeather
//
//  Created by Toheed on 02/02/23.
//

import Foundation
//import UIKit
import RxSwift
import RxCocoa

struct Resource<T> {
    let url: URL
}

extension URLRequest {
    
    
    //Throwing Error
    static func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        
        return Observable.just(resource.url)
            .flatMap { url -> Observable<(response: HTTPURLResponse, data: Data)> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.response(request: request)
            }.map { response, data -> T in
                // ~= is going to do is this is going to check if the response status code is within or inside this particular range.
                if 200..<300 ~= response.statusCode {
                    return try JSONDecoder().decode(T.self, from: data)
                } else {
                    throw RxCocoaURLError.httpRequestFailed(response: response, data: data)
                }
                
        }.asObservable()
        
    }
    
    /*
    static func load<T: Decodable>(resource: Resource<T>) -> Observable<T> {
        
        return Observable.from([resource.url])
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map { data -> T in
                return try JSONDecoder().decode(T.self, from: data)
        }.asObservable()
        
    }*/
    
}
