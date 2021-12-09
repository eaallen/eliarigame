//
//  Interaction.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/3/21.
//

import Foundation

protocol Interaction {
    var id: UUID {get}
    var description: String? {get}
}


struct ARInteraction : Interaction {
    var id = UUID()
    let modelName: String
    let handler: ARModelHandler
    var description: String?
    
    init(modelName: String, description: String?){
        self.handler = ARModelHandler(modelName: modelName)
        self.modelName = modelName
        self.description = description
    }
    
    
}
