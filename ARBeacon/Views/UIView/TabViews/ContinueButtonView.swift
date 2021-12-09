////
////  ContinueButtonView.swift
////  ARBeacon
////
////  Created by Seth Erickson on 12/8/21.
////
//
//import SwiftUI
//
//struct ContinueButtonView: View {
//
//    @State var animate: Bool = false
//
//    var body: some View {
//
//        NavigationLink(destination: MapView(),
//                       label: {
//            Text("Continue")
//                .foregroundColor(.white)
//                .font(.system(size: 32))
//                .frame(width: 250, height: 50)
//                .background(animate ? Constants.customGreen : Constants.customBlue)
//                .cornerRadius(10)
//        })
//            .padding(.horizontal, animate ? 30 : 50)
//            .shadow(
//                color: animate ? Constants.customGreen : Constants.customBlue,
//                radius: animate ? 30 : 10,
//                x: 0,
//                y: animate ? 50 : 30)
//            .scaleEffect(animate ? 1.1 : 1.0)
//            .offset(y: animate ? 7 : 0)
//    }
//        .multilineTextAlignment(.center)
//        .padding(40)
//        .onAppear(perform: addAnimation)
//
//    func addAnimation() {
//        guard !animate else { return }
//        DispatchQueue.main.asyncAfter(deadline: now() + 2.0) {
//            withAnimation {
//                Animation
//                    .easeInOut(duration: 2.0)
//                    .repeatForever()
//            }
//            animate.toggle()
//        }
//    }
//}
//
//
//private struct Constants {
//    static let tintColor: Color = .black
//    static let accentColor: Color = .white
//    static let customGreen: Color = Color(hex: "#1BA689")
//    static let customDarkGreen: Color = Color(hex: "#326e75")
//    static let customBlue: Color = Color(hex: "#41c1c0")
//    static let customLightBlue: Color = Color(hex: "#d0ecef")
//    static let customOrange: Color = Color(hex: "#fbcbab")
//    static let cornerRadius: CGFloat = 15
//}
//
//
//struct ContinueButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContinueButtonView()
//    }
//}
//
