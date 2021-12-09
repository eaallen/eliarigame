//
//  Brain.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/3/21.
//

import Foundation


// brain will be a very state full component so I am makeing it a class
// I think it would be best to only declare Brain once and use it in the Portal ViewModel
class Brain {
    let beaconDetector = BeaconDetector()
    var currentTask = InteractionCollection.ARCovid1
    
}



struct InteractionCollection {
    // AR Interations
    static let ARCovid1 = ARInteraction(modelName: "covid19", description: "model used in finding the covid-19 specimen task")
}
