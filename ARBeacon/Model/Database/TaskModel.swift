//
//  TaskModel.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/1/21.
//

import Foundation
import GRDB

struct TaskModel: TableRecord, FetchableRecord, PersistableRecord, Identifiable {
    func encode(to container: inout PersistenceContainer) {
        container[Table.id] = id
        container[Table.task_number] = task_number
        container[Table.task_name] = task_name
        container[Table.task_description] = task_description
        container[Table.is_completed] = is_completed
    }

    struct Table {
        static let databaseTableName = "tasks"

        static let id = "id"
        static let task_number = "task_number"
        static let task_name = "task_name"
        static let task_description = "task_description"
        static let is_completed = "is_completed"
    }

    // MARK: - Properties

    var id: Int
    var task_number: Int
    var task_name: String
    var task_description: String
    var is_completed: Bool

    // MARK: - Initialization

    init(row: Row) {
        id = row[Table.id]
        task_number = row[Table.task_number]
        task_name = row[Table.task_name]
        task_description = row[Table.task_description]
        is_completed = row[Table.is_completed]
    }

    init(id: Int, task_number: Int, task_name: String, task_description: String, is_completed: Bool) {
        self.id = id
        self.task_number = task_number
        self.task_name = task_name
        self.task_description = task_description
        self.is_completed = is_completed
    }
}
