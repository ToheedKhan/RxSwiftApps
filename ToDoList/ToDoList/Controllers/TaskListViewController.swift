//
//  TaskListViewController.swift
//  ToDoList
//
//  Created by Toheed Jahan Khan on 01/02/23.
//

import UIKit
import RxSwift
import RxCocoa

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    /*
     BehaviorRelay is a part of RxCocoa
     If you are using Behavior Relay, you won't be able to change the state of that particular object by appending to it.
     
     IF you need to append something you will have to create or completely override that particular thing.
     
     So the state will not be maintained.
     
     You can alter the state, but you can find a brand new state.
     */
    private var tasks = BehaviorRelay<[Task]>(value: [])
    private var filteredTasks = [Task]()
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int {
        return self.filteredTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath)
        
        var config = cell.defaultContentConfiguration()
        
        config.text = self.filteredTasks[indexPath.row].title
//        config.secondaryText =
        
        cell.contentConfiguration = config
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navC = segue.destination as? UINavigationController, let addTVC = navC.viewControllers.first as? AddTaskViewController else {
            fatalError("Controller not found...")
        }
        
        addTVC.taskSubjectObservable.subscribe(onNext: {
            [unowned self] task in
            
            let priority = Priority(rawValue: self.prioritySegmentedControl.selectedSegmentIndex - 1)
            
            /*
             Cannot use mutating member on immutable value: 'value' is a get-only property.
             Here we can't use append with BehaviorRelay
             */
//            self.tasks.value.append(task)
            
            var existingTasks = self.tasks.value
            existingTasks.append(task)
            
            //The only way to add item is to use accept
            self.tasks.accept(existingTasks)
            
            filterTasks(by: priority)
        }).disposed(by: disposeBag)
    }
    
    @IBAction func priorityValueChanged(segmentedControl: UISegmentedControl) {
        
        let priority = Priority(rawValue: segmentedControl.selectedSegmentIndex - 1)
        
        filterTasks(by: priority)
    }
    
    private func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func filterTasks(by priority: Priority?) {
        if priority == nil {
            self.filteredTasks = self.tasks.value
            self.updateTableView()
        } else {
            self.tasks.map { tasks in
                return tasks.filter { $0.priority == priority! }
            }.subscribe(onNext: { [weak self] tasks1 in
                self?.filteredTasks = tasks1
                self?.updateTableView()
            }).disposed(by: disposeBag)
        }
    }
}

