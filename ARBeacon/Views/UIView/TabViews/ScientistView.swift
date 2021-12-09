//
//  ScientistView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/8/21.
//

import SwiftUI

struct ScientistView: View {
    
    var displayText: String
    
    var body: some View {
        ZStack {
            Image("scientist")
                .aspectRatio(contentMode: .fit)
                .overlay(Text(displayText)
                            .padding(20)
                            .font(.system(size: 15, weight: .bold))
                            .frame(width: 200, height: 80, alignment: .center)
                            .offset(x: -105, y: -40)
                         )
        }
        .background(.clear)
    }
}

struct ScientistViewForMission: View {
    
    var displayText: String
    
    var body: some View {
        ZStack {
            Rectangle().scaledToFit().padding()
            Text(displayText)
                .foregroundColor(.white)
                .frame(width: 350, alignment: .center)
                .font(.system(size: 35, weight: .bold))
                .aspectRatio(contentMode: .fit)
                .overlay(Image("scientist")
                            .padding(20)
                            .offset(x: 80, y: 250)
                         )
            
        }
        .background(.clear)
    }
}
