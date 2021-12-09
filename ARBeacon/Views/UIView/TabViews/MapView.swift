//
//  MapView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 11/28/21.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        VStack(spacing: 0) {
            TopHeader(currentTab: "Map")
            Spacer()
            Image("scientist")
        }.edgesIgnoringSafeArea(.top)
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
