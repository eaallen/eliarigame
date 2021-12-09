//
//  TaskRowView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/7/21.
//

import SwiftUI

struct TaskRowView: View {
    
    let taskId: String
    let taskName: String
    let isCompleted: Bool
    let isEnabled: Bool
    
    var body: some View {
        
        HStack {
            NavigationLink(taskName, destination: SubTaskRowView(taskId: taskId))
            Image(systemName: isCompleted ? Constants.completedTaskImage : Constants.incompleteTaskImage)
                .foregroundColor(isCompleted ? Constants.customGreen : Constants.customOrange)
//            Text("\(String(isEnabled))")
            Spacer()
        }
//        .background(Constants.customLightBlue)
        .font(.system(size: 24))
        .padding(.vertical, 8)
//        .disabled(isEnabled)
    }
}

struct SubTaskRowView: View {
    
    let taskId: String
    @ObservedObject var taskObject = ReadData()
//    @State private var subTasks =

    var body: some View {
        
        if let currentTaskIndex = taskObject.tasks.firstIndex(where: {$0.taskId == taskId}) { //generate a view for the selected task
            let currentTask = taskObject.tasks[currentTaskIndex]
            
            VStack {
                Text(currentTask.taskName)
            
                if currentTask.subTasks.count == 0 {
                    ScientistViewForMission(displayText: String(currentTask.taskDescription))
                        .frame(alignment: .bottomTrailing)
                    Spacer()
                } else {
                    Spacer()
                    List(currentTask.subTasks) { subTask in
                        HStack {
                            NavigationLink("\(subTask.subTaskName)", destination: MapView())
                            Image(systemName: subTask.subTaskIsCompleted ? Constants.completedTaskImage : Constants.incompleteTaskImage)
                                .foregroundColor(subTask.subTaskIsCompleted ? Constants.customGreen : Constants.customOrange)
                            Spacer()
                        }
                        .font(.system(size: 24))
                        .padding(.vertical, 8)
                //        .disabled(isEnabled)
                    }
                    .overlay(ScientistViewForMission(displayText: String(currentTask.taskDescription)), alignment: .bottomTrailing)
                }
            } //end of VStack
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
    
    static let completedTaskImage: String = "checkmark.circle"
    static let incompleteTaskImage: String = "circle"
}
