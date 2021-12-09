//
//  WelcomeViewTest.swift
//  ARTests
//
//  Created by Seth Erickson on 12/9/21.
//

import SwiftUI

extension UserDefaults {
    
    var showWelcomeScreen: Bool {
        get {
            return (UserDefaults.standard.value(forKey: "showWelcomeScreen") as? Bool) ?? true
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "showWelcomeScreen")
        }
    }
}

struct WelcomeView: View {
    
    @State var currentView = true

    var body: some View {
        if currentView {
            WelcomeScreen(showWelcomeScreen: $currentView)
        } else {
            ModeView()
        }
    }
}

struct WelcomeScreen: View {
    
    @Binding var showWelcomeScreen: Bool
    @State var animate: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack {
                Spacer()
                Image("arbox")
//                    .foregroundColor(.white)
//                    .scaledToFit()
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150, alignment: .center)
                    .foregroundColor(.white)
                Spacer()
                Spacer()
                Spacer()
            }
            VStack {
                
                Text("Augmented Reality Experiences")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .foregroundColor(Constants.accentColor)
                Spacer()
                Button {
                    self.showWelcomeScreen = false
                } label: {
                    Text("Start")
                        .foregroundColor(Constants.accentColor)
                        .font(.system(size: 72))
                        .frame(width: 300, height: 80)
                        .background(animate ? Constants.customBlue : Constants.customDarkGreen)
                        .cornerRadius(10)
                }
                    .padding(.horizontal, animate ? 10 : 20)
                    .shadow(
                        color: animate ? Constants.customBlue : Constants.customBlue,
                        radius: animate ? 30 : 10,
                        x: 0,
                        y: animate ? 20 : 10)
                    .scaleEffect(animate ? 1.1 : 1.0)
                    .offset(y: animate ? 7 : 0)
                Spacer()
                Text("BYU Life Science Museum")
                    .foregroundColor(.white)
                
            }
            .padding()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .multilineTextAlignment(.center)
            .padding(40)
            .background(Constants.customGreen)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1.5)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct ModeView: View {
    
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
                    NavigationLink(destination: BeaconDebugView()) {
                        Text("Debug")
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
//                .background(Constants.customGreen)
            }.edgesIgnoringSafeArea(.all)
    } // end of body
}

private struct Constants {
    static let tintColor: Color = .black
    static let accentColor: Color = .white
    static let customGreen: Color = Color(hex: "#1BA689")
    static let customGreenUI: UIColor = UIColor(hex: "#1BA689")
    static let customDarkGreen: Color = Color(hex: "#326e75")
    static let customBlue: Color = Color(hex: "#41c1c0")
    static let customLightBlue: Color = Color(hex: "#d0ecef")
    static let customLightBlueUI: UIColor = UIColor(hex: "#d0ecef")
    static let customOrange: Color = Color(hex: "#fbcbab")
    
    static let frameWidth: CGFloat = 350
    static let frameHeight: CGFloat = 150
    static let cornerRadius: CGFloat = 15
}
