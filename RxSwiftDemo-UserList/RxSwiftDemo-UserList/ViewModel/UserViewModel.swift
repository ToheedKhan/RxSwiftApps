//
//  UserViewModel.swift
//  RxSwiftDemo-UserList
//
//  Created by Toheed Jahan Khan on 17/01/23.
//

import Foundation
import RxSwift
import RxCocoa

struct UserDetailViewModel {
    var userData = User(id: 1, email: "abc@gmail.com", first_name: "abc", last_name: "xyz", avatar: "avatar")
    /*
     contains user data along with a favourite property with initial value as false of type 'BehaviorRelay' so that whenever we change the favourite status it automatically updates the star image indication.
     */
    var isFavorite: BehaviorRelay<Bool> = BehaviorRelay(value: false)
    var isFavObservable: Observable<Bool> {
        return isFavorite.asObservable()
    }
}

class UserViewModel {
    
    let request = APIService()
    var users: Observable<[User]>?
    private let userViewModel = BehaviorRelay<[UserDetailViewModel]>(value: [])
    var userViewModelObserver: Observable<[UserDetailViewModel]> {
        return userViewModel.asObservable()
    }
    
    private let disposeBag = DisposeBag()
    
    func fetchUserList() {
        users = request.callAPI()
        users?.subscribe(onNext: { (value) in
            var userViewModels = [UserDetailViewModel]()
            for index in 0..<value.count {
                var user = UserDetailViewModel()
                user.userData = value[index]
                userViewModels.append(user)
            }
            self.userViewModel.accept(userViewModels)
        }, onError: { (error) in
            _ = self.userViewModel.catch { (error) in
                Observable.empty()
            }
            print(error.localizedDescription)
        }).disposed(by: disposeBag)
    }
}
