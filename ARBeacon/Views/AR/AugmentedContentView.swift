//
//  AugmentedContentView.swift
//  ARBeacon
//
//  Created by Gove Allen on 11/16/21.
//

import SwiftUI
import RealityKit
import ARKit

struct AugmentedContentView : View {
    @ObservedObject private var beaconDetector = BeaconDetector()
    @State var objectIsPlaced = false
    var body: some View {
        ZStack {
            ARViewContainer(objectIsPlaced: $objectIsPlaced).edgesIgnoringSafeArea(.all)
            Text(translateProximity(beaconDetector.beaconDistance))
                .font(.headline)
                .padding()
                .background(.white.opacity(0.5))
        }
        .onAppear(perform: beaconDetector.startScanning)
        .onDisappear(perform: beaconDetector.stopScanning)
    }
    
    func translateProximity(_ distance: CLProximity)->String {
        switch distance {
        case .unknown:
            return ""
        case .far:
            return "Warm"
        case .near:
            return "Hot"
        case .immediate:
            return "You should look behind you."
        default:
            return ""
        }
    }
    
    struct ARViewContainer: UIViewRepresentable {
        @Binding var objectIsPlaced: Bool
        
        func makeUIView(context: Context) -> ARGameView {
            let arView = ARGameView(frame: .zero, cameraMode: .ar, automaticallyConfigureSession: true)
            
            arView.enableTapGesture(handler: Covid19TapHandler())
            
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
            if !objectIsPlaced {
                // declare the layout of the object in the world absolutly in relation to the camera,
                var layout = SIMD3<Float>()
                layout.x = 0
                layout.y = 0.5
                layout.z = -3
                arView.placeObject(named: "covid19", at: layout)
            }
            
            print(context.environment.scenePhase)
        }
        
        
        
    }

}

