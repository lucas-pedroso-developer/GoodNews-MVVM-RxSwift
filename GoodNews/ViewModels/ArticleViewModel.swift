//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Lucas Daniel on 25/07/20.
//  Copyright © 2020 Lucas. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ArticleViewModel {
    let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
    
    var title: Observable<String> {
        return Observable<String>.just(article.title)
    }
    
    var description: Observable<String> {
        return Observable<String>.just(article.description ?? "")
    }
}
