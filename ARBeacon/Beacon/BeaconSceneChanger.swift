//
//  BeaconSceneChanger.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/9/21.
//

import Foundation
import CoreLocation

class BeaconSceneChanger: BeaconBase {
    var lastDistance = CLProximity.unknown
    var isScanning = false
    
    @Published var beaconDistance : CLProximity = .unknown
    @Published var proximityHistory : [CLProximity] = []
    @Published var shouldNavToHQ = false
    @Published var shouldNavToAug = false
    
    override init(){
        super.init()
    }
    
    override func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if isScanning {
            print("updateing ranges")
            if beacons.count > 0 {
                updateDistance(beacons[0].proximity)
            }
        }
    }
    
    func updateDistance(_ distance: CLProximity) {
        beaconDistance = distance
        proximityHistory.insert(distance, at: 0)
        
        // check for range counts
        if isConsecutiveMatch(distance: .immediate, count: 5) && !shouldNavToAug {
            shouldNavToHQ = true
            isScanning = false
        }else if isConsecutiveMatch(distance: .near, count: 5) && !shouldNavToHQ {
            shouldNavToAug = true
            isScanning = false
        }
    }
    
    func isConsecutiveMatch(distance: CLProximity, count: Int) -> Bool{
        if count > proximityHistory.count {
            return false
        }
        
        for index in 0 ..< count {
            if proximityHistory[index] != distance {
                return false
            }
        }
        return true
    }
    
    func startScanning(beaconUUID: UUID) {
        let beaconRegion = CLBeaconRegion()
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(satisfying: .init(uuid: beaconUUID))
        isScanning = true
        shouldNavToHQ = false
        shouldNavToAug = false
    }
    
    func stopScanning(beaconUUID: UUID){
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
