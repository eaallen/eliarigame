//
//  IBeaconView.swift
//  ARBeacon
//
//  Created by Gove Allen on 11/18/21.
//

import SwiftUI
import CoreLocation



/// Attempting to use ibeacons and navigation views to swithc to other view is prooving a little  buggy.
/// I fear this functionality maybe out side of the SwiftUI usecase, and just another reason to make the switch over to UIKit.
struct IBeaconView: View {
    @ObservedObject private var beaconDetector = BeaconDetector()
    var body: some View {
        ZStack{
            Text("This is the plain view!")
        }
        
        
        .navigate(to: AugmentedContentView(), when: $beaconDetector.shouldNavToAug)
        .navigate(to: HQView(), when: $beaconDetector.shouldNavToHQ)
        
        .onAppear(perform: go)
    }
    
    func go(){
        print("GO!!!!")
        beaconDetector.startScanning()
    }
}




struct IBeaconView_Previews: PreviewProvider {
    static var previews: some View {
        IBeaconView()
    }
}
