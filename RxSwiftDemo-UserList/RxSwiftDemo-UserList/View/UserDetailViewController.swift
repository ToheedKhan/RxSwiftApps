//
//  UserDetailViewController.swift
//  RxSwiftDemo-UserList
//
//  Created by Toheed Jahan Khan on 17/01/23.
//

import Foundation
import RxSwift
import RxCocoa

class UserDetailViewController: UIViewController {
    
    @IBOutlet weak var idNo: UILabel!
    @IBOutlet weak var fullName: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private let disposeBag = DisposeBag()
    var userDetail = BehaviorRelay<UserDetailViewModel>(value: UserDetailViewModel())
    var userDetailObserver: Observable<UserDetailViewModel> {
        return userDetail.asObservable()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Bind button tap via rx
        favoriteButton.rx.tap.bind {
            let favValue = self.userDetail.value.isFavorite
            favValue.accept(!favValue.value)
        }.disposed(by: disposeBag)
        
        userDetailObserver.subscribe(onNext: { (userValue) in
            self.title = "\(userValue.userData.first_name ?? "")'s Details"
            self.idNo.text = "\(userValue.userData.id ?? 0)"
            self.fullName.text = "\(userValue.userData.first_name ?? "") \(userValue.userData.last_name ?? "")"
            self.email.text = "\(userValue.userData.email ?? "")"
            self.setupFavoriteButtonImage(userValue: userValue)
            userValue.isFavObservable.subscribe(onNext: { (value) in
                self.setupFavoriteButtonImage(userValue: userValue)
            }).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
    }
    
    func setupFavoriteButtonImage(userValue: UserDetailViewModel) {
        if userValue.isFavorite.value {
            favoriteButton.setImage(UIImage(systemName: "star.fill")?.withTintColor(UserListCell.starTintColor), for: .normal)
        } else{
            favoriteButton.setImage(UIImage(systemName: "star")?.withTintColor(UserListCell.starTintColor), for: .normal)
        }
    }
}
