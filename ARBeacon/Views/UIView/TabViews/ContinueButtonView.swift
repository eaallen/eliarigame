//
//  ContinueButtonView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/8/21.
//

import SwiftUI

struct ContinueButtonView: View {
    
    var buttonText: String

    @State var animate: Bool = false

    var body: some View {

        ScrollView{
            NavigationLink(destination: MapView(),
                       label: {
            Text(buttonText)
                .foregroundColor(.white)
                .font(.system(size: 32))
                .frame(width: 250, height: 50)
                .background(animate ? Constants.customGreen : Constants.customBlue)
                .cornerRadius(10)
            })
            .padding(.horizontal, animate ? 10 : 20)
            .shadow(
                color: animate ? Constants.customGreen : Constants.customBlue,
                radius: animate ? 30 : 10,
                x: 0,
                y: animate ? 20 : 10)
            .scaleEffect(animate ? 1.1 : 1.0)
            .offset(y: animate ? 7 : 0)
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
    }

    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
                _ = Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            }
            animate.toggle()
        }
    }
}


struct CompleteButton: View {
    
    @State private var navigateToView: Bool = false
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack{
            Rectangle()
                .background(Constants.customGreen)
                .frame(width: 200, height: 75, alignment: .center)
                .cornerRadius(15)
            Text("Continue")
                .font(.system(size: 24))
                .fontWeight(.bold)
                .foregroundColor(.white)
                
        }
        .onTapGesture {
            navigateToView = true //navigate onClick!
        }
        .navigate(to: MainNavigationView(), when: $navigateToView)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            withAnimation {
                _ = Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            }
            animate.toggle()
        }
    }
}

