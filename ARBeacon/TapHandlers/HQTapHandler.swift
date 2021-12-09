//
//  HQTapHandler.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/9/21.
//

import Foundation
import RealityKit
import ARKit

struct HQTapHandler : ARModelOnTapHandler {
    func success (
        results: [CollisionCastHit],
        rayResult: RayResult,
        tapLocation: CGPoint,
        arGameView: ARGameView
    ){
        print("success")
        if let ent = results.first?.entity{
            for animation in ent.availableAnimations {
                ent.playAnimation(animation.repeat())
            }
            
        }
    }
    
    func failure(rayResult:RayResult, tapLocation:CGPoint, arGameView:ARGameView) {
        print("failure")
    }
    
}
