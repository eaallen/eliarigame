//
//  ReadJsonData.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/6/21.
//

import Foundation

class ReadData: ObservableObject  {
    @Published var tasks = [TaskObject]()

    init(){
        loadData()
    }

    func loadData()  {
        guard let url = Bundle.main.url(forResource: "tasks", withExtension: "json")
            else {
                print("Json file not found")
                return
            }

        let data = try? Data(contentsOf: url)
        let tasks = try? JSONDecoder().decode([TaskObject].self, from: data!)
        self.tasks = tasks!
    }
    
//    func updateItem(item: TaskObject) {
//        if let index = tasks.firstIndex(where: {$0.id == item.id})
//            items[index] = //
//    }
    
//    func saveData() {
//        let encodedData = try? JSONEncoder().encode(tasks)
//    }
    
}

