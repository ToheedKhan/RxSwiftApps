//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Toheed Jahan Khan on 01/02/23.
//

import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    let disposeBag = DisposeBag()

    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = true
        //        navigationItem.largeTitleDisplayMode = .automatic
        //            navigationController?.navigationBar.sizeToFit()
        
        //        self.tableView.contentInsetAdjustmentBehavior = .never
        
        populateNews()
    }
    
    private func populateNews() {
       /* let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=7cba6346bfe04056b4d19fd3feef6980")!
        //You can use observable(from as well
        //just - Returns an observable sequence that contains a single element.
        Observable.just(url)
            .flatMap { url -> Observable<Data> in
            let request = URLRequest(url: url)
            return URLSession.shared.rx.data(request: request)
        }.map { data -> [Article]? in
            print(data)
            return try? JSONDecoder().decode(ArticleList.self, from: data).articles
        }.subscribe(onNext: { [weak self] articles in
            
            if let articles = articles {
                self?.articles = articles
                print(articles)
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }).disposed(by: disposeBag)
        */
        
        /*
         
         //Move this part into the ArticleList extension
         
         let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=7cba6346bfe04056b4d19fd3feef6980")!
         
         let resource = Resource<ArticlesList>(url: url)
         */
        URLRequest.load(resource: ArticleList.all)
            .subscribe(onNext: { [weak self] result in
                
                if let result = result {
                    self?.articles = result.articles
                    print(result)
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell does not exist")
        }
        
        cell.titleLabel.text = self.articles[indexPath.row].title
        cell.descriptionLabel.text = self.articles[indexPath.row].description
        
        return cell
    }
}
