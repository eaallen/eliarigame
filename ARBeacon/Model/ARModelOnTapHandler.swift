//
//  ARModelOnTapHandler.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/6/21.
//

import Foundation
import RealityKit
import ARKit
protocol ARModelOnTapHandler {
    typealias RayResult = (origin: SIMD3<Float>, direction: SIMD3<Float>)
    
    func success(results: [CollisionCastHit], rayResult: RayResult, tapLocation: CGPoint, arGameView: ARGameView ) -> Void
    
    func failure(rayResult: RayResult, tapLocation: CGPoint, arGameView: ARGameView ) -> Void
}

/// Used for models that do not need any action to take place when tap gesture is registered
struct DefaultTapHandler : ARModelOnTapHandler{
    func success(results: [CollisionCastHit], rayResult: RayResult, tapLocation: CGPoint, arGameView: ARGameView ) {}
    
    func failure(rayResult: RayResult, tapLocation: CGPoint, arGameView: ARGameView ) {}
}
