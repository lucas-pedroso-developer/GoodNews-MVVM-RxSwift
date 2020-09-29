//
//  ArticleListViewModel.swift
//  GoodNews
//
//  Created by Lucas Daniel on 29/09/20.
//  Copyright © 2020 Lucas. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    let articlesVM: [ArticleViewModel]
    
    init(_ articles: [Article]) {
        self.articlesVM = articles.compactMap(ArticleViewModel.init)
    }    
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
     
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articlesVM.count
    }
    
    func articleAt(_ index: Int) -> ArticleViewModel {
        let article = self.articlesVM[index].article
        return ArticleViewModel(article)
    }
}
