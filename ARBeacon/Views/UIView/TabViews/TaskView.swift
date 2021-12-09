//
//  TaskView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 11/28/21.
//

import SwiftUI

struct TaskView: View {
    
    @ObservedObject var taskContent: TaskViewModel
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 0) {
                TopHeader(currentTab: "Tasks")
                Spacer()
                List {
                    NavigationLink("Find the Covid Molecule", destination: AugmentedContentView())
                    NavigationLink("Welcome to HQ!", destination: HQView())
                    ForEach(0..<50) { task in
                        NavigationLink("\(task)", destination: MapView())
                    }
                }
                HStack {
                    Text("Complete the tasks to help stop Covid-19")
                        .padding()
                        .font(.system(size: 18, weight: .bold))
                    Image("scientist")
                        .aspectRatio(contentMode: .fit)
                    .offset(x: 0, y: -50)
                }
                .offset(x: 0, y: 40)
            }.edgesIgnoringSafeArea(.top)
                
            
            
//                .position(x: 290, y: 700)
            
        }
            
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView(taskContent: TaskViewModel())
    }
}


