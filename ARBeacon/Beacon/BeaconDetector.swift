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
class BeaconDetector: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    var lastDistance = CLProximity.unknown
    var isScanning = false
    @Published var beaconDistance : CLProximity = .unknown
    @Published var beaconDistances : [CLProximity] = []
    @Published var shouldNavToHQ = false
    @Published var shouldNavToAug = false
    override init(){
        super.init()
        
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        
        // this is a call that has to do with user permision to access privacy. I am not sure why it working at the moment
        locationManager?.requestWhenInUseAuthorization()
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            guard CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) else {return beaconsWereNotGivenPermission()}
            guard CLLocationManager.isRangingAvailable() else {return beaconsWereNotGivenPermission()}
        }else {
            beaconsWereNotGivenPermission()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        if isScanning {
            if beacons.count > 0 {
                updateDistance(beacons[0].proximity)
            } else {
                updateDistance(.unknown)
            }
        }
    }
    
    // MARK: - Helper Methods
    
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
    
    func beaconsWereNotGivenPermission(){
        // tell the user that the game cannont continue with out allowing permissions
        print("beacons not given permisison!")
    }
    
    func startScanning() {
        let uuid = UUID(uuidString: "CC6ED3C0-477E-417B-81E1-0A62D6504061")!
        let beaconRegion = CLBeaconRegion()
        locationManager?.startMonitoring(for: beaconRegion)
        locationManager?.startRangingBeacons(satisfying: .init(uuid: uuid))
        isScanning = true
        shouldNavToHQ = false
        shouldNavToAug = false
    }
    
    func stopScanning(){
        let uuid = UUID(uuidString: "CC6ED3C0-477E-417B-81E1-0A62D6504061")!
        let beaconRegion = CLBeaconRegion()
        locationManager?.stopMonitoring(for: beaconRegion)
        locationManager?.stopRangingBeacons(satisfying: .init(uuid: uuid))
        isScanning = false
    }
}
