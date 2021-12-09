//
//  BeaconDetector.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/2/21.
//

import Foundation
import CoreLocation
import Combine
import SwiftUI



// we tell the this what beacons we are interested in, it returns a list of those beacons with the range of them
class BeaconDetector: BeaconBase {
    var lastDistance = CLProximity.unknown
    var isScanning = false
    var beaconUUID: UUID
    
    @Published var beaconDistance : CLProximity = .unknown
    @Published var beaconDistances : [CLProximity] = []
    @Published var shouldNavToHQ = false
    @Published var shouldNavToAug = false
    
    init(beaconUUID: UUID){
        self.beaconUUID = beaconUUID
        
        super.init()
    }
    
    override func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if isScanning {
            if beacons.count > 0 {
                updateDistance(beacons[0].proximity)
            } else {
                updateDistance(.unknown)
            }
        }
    }
    
    func updateDistance(_ distance: CLProximity) {
        beaconDistance = distance
        beaconDistances.insert(distance, at: 0)
        
        // check for range counts
        shouldNavToHQ = isConsecutiveMatch(distance: .immediate, count: 3) && !shouldNavToAug
        shouldNavToAug = isConsecutiveMatch(distance: .near, count: 3) && !shouldNavToHQ
        
        // if either of these is true, we need to stop scanning
        if shouldNavToHQ || shouldNavToAug {
            stopScanning()
        }
    }
    
    func isConsecutiveMatch(distance: CLProximity, count: Int) -> Bool{
        if count > beaconDistances.count {
            return false
        }
        
        for index in 0 ..< count {
            if beaconDistances[index] != distance {
                return false
            }
        }
        return true
    }
    
    func startScanning() {
        let beaconRegion = CLBeaconRegion()
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(satisfying: .init(uuid: beaconUUID))
        isScanning = true
        shouldNavToHQ = false
        shouldNavToAug = false
    }
    
    func stopScanning(){
        let beaconRegion = CLBeaconRegion()
        locationManager?.stopMonitoring(for: beaconRegion)
        locationManager?.stopRangingBeacons(satisfying: .init(uuid: beaconUUID))
        isScanning = false
    }
    
   static func translateProximity(_ distance: CLProximity)->String {
       print("translate proximity")
        switch distance {
        case .unknown:
            return "Unknown"
        case .far:
            return "Far"
        case .near:
            return "Near"
        case .immediate:
            return "Immediate"
        default:
            return "Default"
        }
    }
}
