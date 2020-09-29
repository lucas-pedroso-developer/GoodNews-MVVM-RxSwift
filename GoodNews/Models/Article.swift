//
//  Article.swift
//  GoodNews
//
//  Created by Lucas Daniel on 25/07/20.
//  Copyright © 2020 Lucas. All rights reserved.
//

import Foundation

struct ArticleResponse: Decodable {
    let articles: [Article]
}

extension ArticleResponse {
    static var resource: Resource<ArticleResponse> = {
        let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-09-21&sortBy=publishedAt&apiKey=c3fee8b314dc411c8afdc11184f3682d")!
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String?
}
