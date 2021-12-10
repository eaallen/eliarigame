//
//  NeonVentFan.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/9/21.
//

import SwiftUI
import RealityKit
import ARKit
import FocusEntity

struct NeonVentFanView: View {
    @State var placeObject = false
    var body: some View {
        ZStack{
            ARViewContainer(placeObject: $placeObject).onAppear(){placeObject = true}
            if !placeObject{
                Text("The fan will appear when a vertical plane is detected")
            }
        }
    }
    
    
    struct ARViewContainer: UIViewRepresentable {
        @Binding var placeObject: Bool
        private let modelName = "NeonVentAniX"
        func makeUIView(context: Context) -> ARGameView {
            let arView = ARGameView(frame: .zero)
            
            arView.enableTapGesture(handler: DefaultTapHandler())
            
            let config = ARWorldTrackingConfiguration()
            config.planeDetection = [ .vertical]
            config.environmentTexturing = .automatic
            
            // not all versions of ios support this feature
            if ARWorldTrackingConfiguration.supportsSceneReconstruction(.mesh){
                config.sceneReconstruction = .mesh
            }
            
            arView.session.run(config)
            
            // add the focus entity to the ARView
            let _ = FocusEntity(on: arView, focus: .classic)
            
            return arView
        }
        
        func updateUIView(_ arView: ARGameView, context: Context) {
//            if placeObject {
//                let anchorEntity = AnchorEntity(plane: .any)
//                arView.addModelEntityToAnchorThenScene(modelName: modelName, scaleTo: nil, anchor: anchorEntity)
//            }
        }
        
        
        
    }
    
    
}

