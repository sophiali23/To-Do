//
//  TaskRepository.swift
//  To Do
//
//  Created by Sophia Li on 2021-01-02.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class TaskRepository: ObservableObject {
    let db = Firestore.firestore()
    
    @Published var tasks = [Task]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        let userId = Auth.auth().currentUser?.uid
        
        db.collection("tasks")
            .order(by: "createdTime")
            .whereField("userId", isEqualTo: userId)
            .addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.tasks = querySnapshot.documents.compactMap { document in
                    try? document.data(as: Task.self)
                }
            }
        }
    }
    
    func addTask(_ task: Task) {
        do {
            var addedTask = task
            addedTask.userId = Auth.auth().currentUser?.uid
            let _ = try db.collection("tasks").addDocument(from: addedTask)
        }
        catch {
            fatalError("Unable to encode task: \(error.localizedDescription)")
        }
    }
    
    func updateTask(_ task: Task) {
        if let taskID = task.id {
            do {
                try db.collection("tasks").document(taskID).setData(from: task)
            }
            catch {
                fatalError("Unable to encode task: \(error.localizedDescription).")
            }
        }
    }
    
    // TO DO - deleteTask
}
