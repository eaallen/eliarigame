//
// TaskView.swift
// ARBeacon
//
// Created by Seth Erickson on 11/28/21.
//

import SwiftUI

struct TaskView: View {
    
    @ObservedObject var taskContent = ReadData()
    @State private var showAlert = false
//    @State private var isEnabled = true
    
//    init(){
//        UITableView.appearance().backgroundColor = .clear
//    }
    
    var body: some View {
        
        //ZStack {
            VStack {
                // MARK: - Header
                VStack(spacing: 0) {
                    TopHeader(currentTab: "Tasks")
                }.edgesIgnoringSafeArea(.top)
                
                // MARK: - Main View
                
                List {
                    //loop through Tasks
                    ForEach(taskContent.tasks) { task in
                        if task.dependsOn == "" {
                            TaskRowView(taskId: task.taskId, taskName: task.taskName, isCompleted: task.isCompleted, isEnabled: true)
                        } else {
//                            if let index = taskContent.tasks.firstIndex(where: {$0.taskId == task.dependsOn})
//                                taskContent.tasks[index].dependsOn
                            TaskRowView(taskId: task.taskId, taskName: task.taskName, isCompleted: task.isCompleted, isEnabled: false)
                        }
                    }
                }
                .offset(x: 0, y: -50)
                .padding(.bottom, 10)
                .overlay(ScientistView(displayText: ""), alignment: .bottomTrailing)
            }
            .background(.clear)
       // }
    }
}
