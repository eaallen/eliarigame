//
//  HelpView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 11/28/21.
//

import SwiftUI

struct HelpView: View {
    var body: some View {

        
        VStack(spacing: 0) {
            TopHeader(currentTab: "Help")
            Spacer()
            Text("Help View")
        }.edgesIgnoringSafeArea(.top)
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}
