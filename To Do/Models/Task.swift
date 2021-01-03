//
//  Task.swift
//  To Do
//
//  Created by Sophia Li on 2021-01-01.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Task: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp?
    var userId: String?
}

#if DEBUG
let testDataTasks = [
    Task(title: "Workout", completed: true),
    Task(title: "Do Laundry", completed: false),
    Task(title: "Buy Groceries", completed: false),
    Task(title: "Feed Cat", completed: false)
]
#endif
