//
//  Article.swift
//  GoodNews
//
//  Created by Lucas Daniel on 25/07/20.
//  Copyright © 2020 Lucas. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

extension ArticleList {
    static var all: Resource<ArticleList> = {
        let url = URL(string: "http://newsapi.org/v2/everything?q=bitcoin&from=2020-09-21&sortBy=publishedAt&apiKey=c3fee8b314dc411c8afdc11184f3682d")!
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String
    
}


