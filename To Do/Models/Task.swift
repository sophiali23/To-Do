//
//  Task.swift
//  To Do
//
//  Created by Sophia Li on 2021-01-01.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}

#if DEBUG
let testDataTasks = [
  Task(title: "Workout", completed: true),
  Task(title: "Do Laundry", completed: false),
  Task(title: "Buy Groceries", completed: false),
  Task(title: "Feed Cat", completed: false)
]
#endif
