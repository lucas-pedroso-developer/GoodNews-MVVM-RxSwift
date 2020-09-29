//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Lucas Daniel on 25/07/20.
//  Copyright © 2020 Lucas. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewListTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    private var articleListVM: ArticleListViewModel!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        populateNews()
    }
    
    private func populateNews() {        
        URLRequest.load(resource: ArticleResponse.resource)
            .subscribe(onNext: { result in
                let articles = result!.articles
                self.articleListVM = ArticleListViewModel(articles)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }).disposed(by: disposeBag)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ArticleTableViewCell else { fatalError("ArticleTableViewCellNotFound") }
                        
        let articleVM = self.articleListVM.articleAt(indexPath.row)
        
        articleVM.title.asDriver(onErrorJustReturn: "")
            .drive(cell.titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.description.asDriver(onErrorJustReturn: "")
            .drive(cell.descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        
        return cell
    }
    
}
