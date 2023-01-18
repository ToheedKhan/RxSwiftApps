//
//  LoginViewModel.swift
//  LoginExample
//
//  Created by Toheed Jahan Khan on 18/01/23.
//

import Foundation
import RxCocoa
import RxSwift

struct LoginViewModel {
//    2
    let email = BehaviorRelay<String>(value: "")
//    3
    let password = BehaviorRelay<String>(value: "")
//    4
    let isValid: Observable<Bool>
    
    init() {
//        5
        isValid = Observable.combineLatest(self.email.asObservable(), self.password.asObservable())
        { (email, password) in
//            6
            return email.isValidEmail()
                && password.isValidPassword()
        }
    }
}
