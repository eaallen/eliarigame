//
//  TaskViewModel.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/1/21.
//

import Foundation

class TaskViewModel: ObservableObject {
    private struct Constants {
        // list constants here if necessary
    }

    // MARK: - Model Access

    var tasks: [TaskModel] {
        ARDatabase.shared.getTasks() // get tasks from task model
    }


    // MARK: - User Intents

    // The only task operation a user will control is if they complete the task
    func updateTask(_ is_complete: Bool, for task: TaskModel) {
        ARDatabase.shared.updateTaskTable(task)
        objectWillChange.send()
    }


    //    func removeTask(at indes: Int) {
    //        if index >= 0 && index < tasks.count {
    //            ARDatabase.shared.deleteTaskTable(tasks[index])
    //        }
    //    }

// @Published var saveError = false
//    private func save() {
//        do {
//            try TaskModel.save()
//        } catch {
//            saveError = true
//        }
//    }
}
