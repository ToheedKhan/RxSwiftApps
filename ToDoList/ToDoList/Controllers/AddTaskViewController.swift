//
//  AddTaskViewController.swift
//  ToDoList
//
//  Created by Toheed Jahan Khan on 01/02/23.
//

import UIKit


class AddTaskViewController: UIViewController {
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var taskTitleTextField: UITextField!

    @IBAction func save() {
     
        self.dismiss(animated: true)
    }
}
