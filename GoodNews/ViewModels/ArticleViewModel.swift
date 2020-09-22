//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Lucas Daniel on 25/07/20.
//  Copyright © 2020 Lucas. All rights reserved.
//

import Foundation

struct ArticleListViewModel {    
    let articleList: ArticleList
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
     
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articleList.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articleList.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article: Article    
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        return self.article.title
    }
    
    var description: String {
        return self.article.description
    }
}
