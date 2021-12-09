//
//  ARViewUtils.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/4/21.
//

import SwiftUI
import ARKit
import RealityKit

extension ARView {
       
    func placeCube( at position: SIMD3<Float>){
        let mesh = MeshResource.generateBox(size: 0.3)
        let material = SimpleMaterial(color: .randomColor(), roughness: 0.3, isMetallic: true)
        let modelEntity = ModelEntity(mesh: mesh, materials: [material])
        modelEntity.generateCollisionShapes(recursive: true)
        
        let anchorEnt = AnchorEntity(world: position)
        anchorEnt.addChild(modelEntity)
        self.scene.addAnchor(anchorEnt)
        
    }
    
    func placeObject(named modelName: String, at position: SIMD3<Float>, scaleTo: SIMD3<Float>? = nil){
        let anchorEntity = AnchorEntity(world: position)
        addModelEntityToAnchorThenScene(modelName: modelName, scaleTo: scaleTo, anchor: anchorEntity)
    }
    
    func placeObject(named modelName: String, on target: AnchoringComponent.Target,  scaleTo: SIMD3<Float>? = nil){
        let anchorEntity = AnchorEntity(target)
        addModelEntityToAnchorThenScene(modelName: modelName, scaleTo: scaleTo, anchor: anchorEntity)
    }
    
    private func addModelEntityToAnchorThenScene(modelName:String, scaleTo: SIMD3<Float>?, anchor: AnchorEntity){
        if let modelEntity = try? ModelEntity.loadModel(named: modelName){
            modelEntity.generateCollisionShapes(recursive: true)
            if let scale = scaleTo {
                anchor.scale = scale
            }
            anchor.addChild(modelEntity)
            self.scene.anchors.append(anchor)
        }
    }
}
