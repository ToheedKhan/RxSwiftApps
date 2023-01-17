//
//  UserListCell.swift
//  RxSwiftDemo-UserList
//
//  Created by Toheed Jahan Khan on 17/01/23.
//

import UIKit

class UserListCell: UITableViewCell {
    
    static let starTintColor = UIColor(red: 212/255, green: 163/255, blue: 50/255, alpha: 1.0)
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    func configureCell(userDetail: UserDetailViewModel) {
        userName.text = userDetail.userData.first_name ?? ""
        if userDetail.isFavorite.value {
            favoriteImage.image = UIImage(systemName: "star.fill")?.withTintColor(UserListCell.starTintColor)
        } else {
            favoriteImage.image = UIImage(systemName: "star")?.withTintColor(UserListCell.starTintColor)
        }
    }
    
}
