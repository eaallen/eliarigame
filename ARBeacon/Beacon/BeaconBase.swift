//
//  BeaconBase.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/9/21.
//

import Foundation
import CoreLocation

class BeaconBase: NSObject, ObservableObject, CLLocationManagerDelegate {
    var locationManager: CLLocationManager?
    override init(){
        super.init()
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        // this is a call that has to do with user permision to access privacy. I am not sure why it working at the moment
        locationManager?.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedAlways || status == .authorizedWhenInUse {
            guard CLLocationManager.isMonitoringAvailable(for: CLBeaconRegion.self) else {return BeaconBase.beaconsWereNotGivenPermission()}
            guard CLLocationManager.isRangingAvailable() else {return BeaconBase.beaconsWereNotGivenPermission()}
        }else {
            BeaconBase.beaconsWereNotGivenPermission()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
    }
    
    private static func beaconsWereNotGivenPermission(){
        // tell the user that the game cannont continue with out allowing permissions
        print("beacons not given permisison!")
    }
    
}
