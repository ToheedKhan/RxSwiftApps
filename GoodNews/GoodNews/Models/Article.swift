//
//  Article.swift
//  GoodNews
//
//  Created by Toheed Jahan Khan on 01/02/23.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

extension ArticleList {
    
}

struct Article: Decodable {
    let title: String
    let description: String
}
