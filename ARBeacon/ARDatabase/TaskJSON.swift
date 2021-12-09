//
//  TaskJSON.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/6/21.
//

import Foundation

struct TaskObject: Codable, Identifiable {
    
    enum CodingKeys: String, CodingKey {
        case taskId = "task_id"
        case arViewId = "ar_view_id"
        case taskName = "task_name"
        case taskDescription = "task_description"
        case taskOrderNumber = "task_order_number"
        case isCompleted = "is_completed"
        case dependsOn = "depends_on"
        case subTasks = "sub_tasks"
}
 
    var id = UUID().uuidString //systemID
    var taskId: String = ""
    var arViewId: String = ""
    var taskName: String = ""
    var taskDescription: String = ""
    var taskOrderNumber: Int = 0
    var isCompleted: Bool = false
    var dependsOn: String = ""
    var subTasks: [SubTaskDataObject] = []
}

struct SubTaskDataObject: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case subTaskId = "subTaskId"
        case subTaskName = "subTaskName"
        case subTaskDescription = "subTaskDescription"
        case subTaskOrderNumber = "sub_task_order_number"
        case subTaskIsCompleted = "sub_task_is_completed"
        case subTaskDependsOn = "sub_task_depends_on"
    }

//    var id = UUID()
    // Note: These MUST be optional because if the subTask array is empty it will throw an ERROR!
    let id = UUID().uuidString
    var subTaskId: String
    var subTaskName: String
    var subTaskDescription: String
    var subTaskOrderNumber: Int
    var subTaskIsCompleted: Bool
    var subTaskDependsOn: String
}

// ***************************** //
