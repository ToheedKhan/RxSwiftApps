//
//  User.swift
//  RxSwiftDemo-UserList
//
//  Created by Toheed Jahan Khan on 17/01/23.
//

import Foundation


struct UsersDataModel: Codable {
    let page: Int?
    let per_page: Int?
    let total: Int?
    let total_page: Int?
    let data: [User]?
}

struct User: Codable {
    let id: Int?
    let email: String?
    let first_name: String?
    let last_name: String?
    let avatar: String?
}
