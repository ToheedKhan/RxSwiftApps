//
//  Article.swift
//  NewsMVVM
//
//  Created by Toheed on 02/02/23.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String?
}
