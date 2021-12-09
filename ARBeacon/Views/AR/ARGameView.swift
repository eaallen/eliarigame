import Foundation
import RealityKit
import ARKit

class ARGameView : ARView {
    var tapHanlder: ARModelOnTapHandler?
    
    required init(frame: CGRect){
        super.init(frame: frame)
    }
    
    override required init(frame: CGRect, cameraMode: ARView.CameraMode, automaticallyConfigureSession: Bool){
        super.init(frame: frame, cameraMode: cameraMode, automaticallyConfigureSession: automaticallyConfigureSession)
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    func enableTapGesture(handler: ARModelOnTapHandler?){
        tapHanlder = handler
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(recognizer:)))
        self.addGestureRecognizer(tapGestureRecognizer)
    }
    
    /// The method that gets called when the user taps on the screen
    @objc func handleTap(recognizer: UITapGestureRecognizer){
        let tapLocation = recognizer.location(in: self)
        
        guard let rayResult = self.ray(through: tapLocation) else {return}
        
        let results = self.scene.raycast(origin: rayResult.origin, direction: rayResult.direction)
        
        if let _ = results.first {
            // we found the ar object with a raycast intersection
            tapHanlder?.success(results: results, rayResult: rayResult, tapLocation: tapLocation, arGameView: self)
        
        } else {
            // raycast did not find anything!
            // this will let us place objects in the game
            tapHanlder?.failure(rayResult: rayResult, tapLocation: tapLocation, arGameView: self)
            
            
        }
    }
    
    
    
}
