//
//  Covid19TapHandler.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/6/21.
//

import Foundation
import RealityKit
import ARKit

struct Covid19TapHandler : ARModelOnTapHandler {
    func success (
        results: [CollisionCastHit],
        rayResult: RayResult,
        tapLocation: CGPoint,
        arGameView: ARGameView
    ){
        if let ent = results.first?.entity{
            
            // roll it!
            let rollTransform = Transform(pitch: 0, yaw: 0, roll: 5)
            ent.move(to: rollTransform, relativeTo: ent, duration: Self.Constants.rollDuration)
            
            wait(Self.Constants.rollDuration){
                // roll it backwords
                let rollTransform = Transform(pitch: 0, yaw: 0, roll: -5)
                ent.move(to: rollTransform, relativeTo: ent, duration: Self.Constants.rollDuration)
                
                wait(Self.Constants.rollDuration){
                    // shrink it!
                    var transform = Transform()
                    transform.scale = SIMD3(0.1,0.1,0.1)
                    transform.translation = ent.position

                    ent.move(to: transform, relativeTo: ent, duration: Self.Constants.shrinkDuration)
                    
                    wait(Self.Constants.shrinkDuration - 0.1){
                        ent.removeFromParent()
                    }
                }
            }
        }
    }
    
    func failure(rayResult:RayResult, tapLocation:CGPoint, arGameView:ARGameView) {}
    
    func wait(_ duration: TimeInterval, callback: @escaping ()->Void){
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            callback()
        }
    }
    
    
    struct Constants {
        static let shrinkDuration: TimeInterval = 1
        static let rollDuration  : TimeInterval = 0.5
        static let totalDuration : TimeInterval = 2
    }
}
