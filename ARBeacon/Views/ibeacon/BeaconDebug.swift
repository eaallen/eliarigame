//
//  BeaconDebugView.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/8/21.
//

import SwiftUI

struct BeaconDebugView: View {
    let beaconUUID = UUID(uuidString: "CC6ED3C0-477E-417B-81E1-0A62D6504061")!
    @ObservedObject private var beaconDetector = BeaconDebugger()
    var body: some View {
        VStack(alignment: .center){
            Text(beaconDetector.currentBeacon?.uuid.uuidString ?? "unknown")
            Text(BeaconDetector.translateProximity(beaconDetector.currentBeacon?.proximity ?? .unknown))
                .font(.largeTitle)
                .padding()
            Text(String(beaconDetector.currentBeacon?.rssi ?? -1))
            List(beaconDetector.beaconHistory){ item in
                beaconDetialRow(item: item)
            }
        }
        .onAppear(perform: startScanning)
        .onDisappear(perform: stopScanning)
    }
    
    func beaconDetialRow(item: BeaconDebugger.BeaconHistoryItem) -> some View {
        VStack{
            Text(item.beacon.uuid.uuidString)
            HStack{
                HStack{
                    Text("Proximity: ")
                    Text(BeaconDetector.translateProximity(item.beacon.proximity))
                }
                Spacer()
                HStack{
                    Text("RSSI: ")
                    Text(String(item.beacon.rssi))
                }
                
            }
            
            
        }
    }
    
    func startScanning(){
        beaconDetector.startScanning(beaconUUID: beaconUUID )
    }
    
    func stopScanning(){
        beaconDetector.stopScanning(beaconUUID: beaconUUID)
    }
}



struct BeaconDebug_Previews: PreviewProvider {
    static var previews: some View {
        BeaconDebugView()
    }
}
