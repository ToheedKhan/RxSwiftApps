//
//  ViewController.swift
//  CitySearcher
//
//  Created by Toheed Jahan Khan on 19/01/23.
//

import UIKit

import RxCocoa
import RxSwift
/*
 In the search bar, we will dynamically try to fetch towns that start with given letters and display it in a table view.

 To build a dynamic search in  app, we have to think about what can go wrong. For instance
 -
 what if I will write really fast and will change my mind often? We would have many API requests which we have to filter. In a real app, you would have to cancel the previous request, wait sometime before sending another request, check for the phrase if it is the same as before and so on.
 */

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var shownCities = [String]() // Data source for UITableView
    let allCities = ["New York", "London", "Oslo", "Warsaw", "Berlin", "Praga"] // Our mocked API data source
    
    let disposeBag = DisposeBag() // Bag of disposables to release them when view is being deallocated
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        
        searchBar
            .rx.text // Observable property thanks to RxCocoa
            .orEmpty // Make it non-optional
            .subscribe(onNext: { [unowned self] query in // Here we will be notified of every new value
                self.shownCities = self.allCities.filter { $0.hasPrefix(query) } // We now do our "API Request" to find cities.
                self.tableView.reloadData() // And reload table view data.
            }).disposed(by: disposeBag)
        }
         
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return shownCities.count
        }
         
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cityPrototypeCell", for: indexPath)
            cell.textLabel?.text = shownCities[indexPath.row]
            
            return cell
        }
}

