//
//  AccountView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 11/28/21.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
//        Text("Account View")
        
        VStack(spacing: 0) {
            TopHeader(currentTab: "Account")
            Spacer()
        }.edgesIgnoringSafeArea(.top)
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
