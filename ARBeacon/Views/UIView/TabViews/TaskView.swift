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
        
        ZStack {
            VStack {
                // MARK: - Header
                VStack(spacing: 0) {
                    TopHeader(currentTab: "Tasks")
                }.edgesIgnoringSafeArea(.top)
                
                // MARK: - Main View
                
                List {
                    //loop through Tasks
                    ForEach(taskContent.tasks) { task in
                        if task.dependsOn == nil {
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
                .overlay(ScientistView(displayText: "Complete the tasks to help stop Covid-19"), alignment: .bottomTrailing)
            }
            .background(.clear)
        }
    }
}

private struct Constants {
    static let tintColor: Color = .black
    static let accentColor: Color = .white
    static let customGreen: Color = Color(hex: "#1BA689")
    static let customDarkGreen: Color = Color(hex: "#326e75")
    static let customBlue: Color = Color(hex: "#41c1c0")
    static let customLightBlue: Color = Color(hex: "#d0ecef")
    static let customOrange: Color = Color(hex: "#fbcbab")
    static let cornerRadius: CGFloat = 15
}
