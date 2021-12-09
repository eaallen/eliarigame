//
//  Tabs.swift
//  ARBeacon
//
//  Created by Seth Erickson on 11/30/21.
//

import Foundation

struct AppSetupModel {
    
    private var currentTabKey: String = "currentTab"
    
    struct Tab: Identifiable {
        var id: Int
        var tabName: String
        var iconName: String
    }

    let tabs = [
        Tab(id: 1, tabName: "Tasks", iconName: "checklist"),
        Tab(id: 2, tabName: "Map", iconName: "map"),
        Tab(id: 3, tabName: "Camera", iconName: "camera"),
        Tab(id: 4, tabName: "Help", iconName: "questionmark"),
        Tab(id: 5, tabName: "Account", iconName: "person")
    ]
//
//    func getCurrentTab(id: Int) {
//
//      if let index:Int = tabs.firstIndex(where: {$0.id == id})
//        var currentTab: String = UserDefaults.standard.set(tabs[id-1].tabName, forKey: currentTabKey)
//
//
//    }
}
//
//private var currentTabKey: String = "currentTab"
//private var currentTab: Int = UserDefaults.standard.integer(forKey: currentTabKey)

   
