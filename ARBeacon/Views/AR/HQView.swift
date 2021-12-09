//
//  HQView.swift
//  ARBeacon
//
//  Created by Gove Allen on 11/16/21.
//

import SwiftUI
import RealityKit
import ARKit

struct HQView : View {
    @State var objectIsPlaced = false
    var body: some View {
        ZStack {
            ARViewContainer(placeObject: $objectIsPlaced)
                .edgesIgnoringSafeArea(.all)
            
            Button("Place Object"){
                objectIsPlaced = true
            }
            
        }
    }
    
    /// view for handling AR content! this connects UIKit to SwiftUI
    struct ARViewContainer: UIViewRepresentable {
        @Binding var placeObject: Bool
        private let modelName = "NeonXStickAni"
        func makeUIView(context: Context) -> ARGameView {
            let arView = ARGameView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
            
            arView.enableTapGesture(handler: nil)
            
            let config = ARWorldTrackingConfiguration()
            config.planeDetection = [.horizontal, .vertical]
            config.environmentTexturing = .automatic
            
            // not all versions of ios support this feature
            if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
                config.sceneReconstruction = .mesh
            }
            
            arView.session.run(config)
            
            return arView
        }
        
        func updateUIView(_ arView: ARGameView, context: Context) {
            if placeObject {
                print("1------>")
                var layout = SIMD3<Float>()
                layout.x = 0
                layout.y = 0
                layout.z = -0.6
                arView.placeObject(named: modelName, at: layout)
                print("2---->")
                
            }
        }
        
        
        
    }
}


