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

struct Article: Decodable {
    let title: String
    let description: String?
}

extension ArticleList {
    static var all: Resource<ArticleList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=7cba6346bfe04056b4d19fd3feef6980")!
        return Resource(url: url)
    }()
}
