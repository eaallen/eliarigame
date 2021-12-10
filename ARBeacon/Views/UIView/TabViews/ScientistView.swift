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
    
    @State var animate: Bool = false
    @State var buttonDisabled = false
    var arViewId: String
    var displayText: String
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle().scaledToFit().padding()
                Text(displayText)
                    .foregroundColor(Constants.whiteBlack)
                    .frame(width: geometry.size.width * 0.9 , alignment: .center)
                    .font(.system(size: 35, weight: .bold))
                    .aspectRatio(contentMode: .fit)
                    .overlay(Image("scientist")
                                .padding(20)
                                .offset(x: 80, y: 250)
                    )
                if arViewId != "" {
                    NavigationLink(destination: ArViewIdMapping(id: arViewId)) {
                        //                buttonDisabled = true
                        //                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        //                    buttonDisabled = false
                        //                }
                        Text("Continue")
                        //.navigationTitle("")
                        //.navigationBarHidden(true)
                            .foregroundColor(Constants.white)
                            .padding(.all, 10)
                        
                    }
                    .disabled(buttonDisabled)
                    .font(.system(size: 24))
                    .frame(width: FileConstants.frameWidth, height: FileConstants.frameHeight, alignment: .center)
                    .background(animate ? Constants.customDarkGreen : Constants.customGreen)
                    .cornerRadius(FileConstants.cornerRadius)
                    .padding(.horizontal, animate ? 10 : 20)
                    .shadow(
                        color: animate ? Constants.customGreen : Constants.customDarkGreen,
                        radius: animate ? 20 : 10,
                        x: 0,
                        y: animate ? 20 : 10)
                    .scaleEffect(animate ? 1.05 : 1.0)
                    //            .offset(y: animate ? 3 : 0)
                    .offset(x: -70, y: 200)
                }
            }
            
            .background(.clear)
            .onAppear(perform: addAnimation)
        }
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

private struct FileConstants {
    
    static let frameWidth: CGFloat = 200
    static let frameHeight: CGFloat = 50
    static let cornerRadius: CGFloat = 15
}

