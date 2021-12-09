//
//  ARViewIdMapping.swift
//  ARBeacon
//
//  Created by Gove Allen on 12/9/21.
//

import Foundation
import RealityKit
import SwiftUI
struct ArViewIdMapping: View {
    var id : String
    var body: some View {
        if id ==  "dc7b0e4c-5eb3-4256-8d5a-3184e06837c4" {
            AugmentedContentView()
        } else if id == "b8e211e5-ada5-4f99-92c7-38f101f109df" {
            HQView()
        } else if id == "50cbd16c-e1b0-492e-9736-183cb3191801" {
            NeonVentFanView()
        } else {
            MainNavigationView()
        }
    }
}
