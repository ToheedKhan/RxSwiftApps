//
//  NewsTableViewController.swift
//  GoodNews
//
//  Created by Toheed Jahan Khan on 01/02/23.
//

import UIKit

class NewsTableViewController: UITableViewController {
    
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = true
//        navigationItem.largeTitleDisplayMode = .automatic
//            navigationController?.navigationBar.sizeToFit()
        
//        self.tableView.contentInsetAdjustmentBehavior = .never

    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
}
