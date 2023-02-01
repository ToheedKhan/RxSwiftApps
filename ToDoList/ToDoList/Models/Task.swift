//
//  Task.swift
//  ToDoList
//
//  Created by Toheed Jahan Khan on 01/02/23.
//

import Foundation

enum Priority: Int {
    case high
    case medium
    case low
}

struct Task {
    let title: String
    let priority: Priority
}
