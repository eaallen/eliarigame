//
//  ARDatabase.swift
//  ARBeacon
//
//  Created by Seth Erickson on 11/28/21.
//

import Foundation
import GRDB
import RealityKit

typealias TaskTable = TaskModel.Table
class ARDatabase {
    
    // MARK: - Constants

    struct Constants {
        static let dbFileName = "arexp"
        static let dbFileExtension = "db"
    }

    // MARK: - Properties

    var dbQueue: DatabaseQueue

    // MARK: - Singleton

    static let shared = ARDatabase()

    private init() {
        if let directoryUrl = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) {
            let fileUrl = directoryUrl
                .appendingPathComponent(Constants.dbFileName)
                .appendingPathExtension(Constants.dbFileExtension)
            let fileExists = FileManager.default.fileExists(atPath: fileUrl.path)

            if let queue = try? DatabaseQueue(path: fileUrl.path) {
                dbQueue = queue
                if !fileExists {
                    createTaskTable()
                }
                return
            }
        }

        fatalError("Unable to connect to database")
    }

    private func createTaskTable() {
        try? dbQueue.write { db in
            // create the table
            try? db.execute(sql: """
                            CREATE TABLE \(TaskTable.databaseTableName)(
                                \(TaskTable.id) INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE,
                                \(TaskTable.task_number) INTEGER NOT NULL UNIQUE,
                                \(TaskTable.task_name)TEXT NOT NULL,
                                \(TaskTable.task_description)task_description TEXT,
                                \(TaskTable.is_completed) INTEGER

                            """)
        }
    }

    // MARK: - CRUD

    func deleteTaskTable(_ record: TaskModel) {
        do {
            try dbQueue.write { db in
                _ = try record.delete(db)
            }
        } catch {
            print("Error deleting record: \(error)")
        }
    }

    func saveTaskTable(_ record: TaskModel) {
        try? dbQueue.write { db in
            try? record.insert(db)
        }
    }

    func updateTaskTable(_ record: TaskModel) {
        try? dbQueue.write { db in
            try? record.update(db)
        }
    }

    func getTasks() -> [TaskModel] {
        do {
            let records = try dbQueue.inDatabase { (db: Database) -> [TaskModel] in
                var tasks = [TaskModel]()

                let rows = try Row.fetchCursor(db, sql: "select * from \(TaskTable.databaseTableName)")

                while let row = try rows.next() {
                    tasks.append(TaskModel(row: row))
                }

                return tasks
            }
            return records
        } catch {
            return []
        }
    }
}
