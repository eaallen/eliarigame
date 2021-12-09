//
//  ControlBoard.swift
//  ARBeacon
//
//  Created by Gove Allen on 11/18/21.
//

import SwiftUI

struct ControlBoard: View {
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("Pick an Experience")){
                        NavigationLink("Augment Your Reality", destination: {
                            MainNavigationView()
                        })
                        NavigationLink("ibeacons", destination: {
                            IBeaconView()
                        })
                    }
                }
            }.frame(alignment: .top)
        }
    }
}

struct ControlBoard_Previews: PreviewProvider {
    static var previews: some View {
        ControlBoard()
    }
}
