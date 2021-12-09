//
//  WelcomeView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/8/21.
//

import SwiftUI

struct WelcomeView: View {
    
//    init(){
//        UINavigationBar.appearance().backgroundColor = Constants.customLightBlueUI
//        }
    
    var body: some View {
        // Mission Mode
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: MainNavigationView()) {
                    Text("Mission")
                        .navigationTitle("")
                        .navigationBarHidden(true)
                        .foregroundColor(Constants.accentColor)
                        .padding(.all, 10)
                }
                .font(.system(size: 72))
                .frame(width: Constants.frameWidth, height: Constants.frameHeight, alignment: .center)
                .background(Constants.customGreen)
                .cornerRadius(Constants.cornerRadius)
                
                Spacer()
                // Exploration Mode
                NavigationLink(destination: MainNavigationView()) {
                    Text("Explore")
                        .navigationTitle("")
                        .navigationBarHidden(true)
                        .foregroundColor(Constants.accentColor)
                        .padding(.all, 10)
                }
                .font(.system(size: 72))
                .frame(width: Constants.frameWidth, height: Constants.frameHeight, alignment: .center)
                .background(Constants.customGreen)
                .cornerRadius(Constants.cornerRadius)
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

private struct Constants {
    static let tintColor: Color = .black
    static let accentColor: Color = .white
    static let customGreen: Color = Color(hex: "#1BA689")
    static let customDarkGreen: Color = Color(hex: "#326e75")
    static let customBlue: Color = Color(hex: "#41c1c0")
    static let customLightBlue: Color = Color(hex: "#d0ecef")
    static let customLightBlueUI: UIColor = UIColor(hex: "#d0ecef")
    static let customOrange: Color = Color(hex: "#fbcbab")
    
    static let frameWidth: CGFloat = 350
    static let frameHeight: CGFloat = 150
    static let cornerRadius: CGFloat = 15
}
