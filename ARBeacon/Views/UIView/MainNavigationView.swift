//
//  MainView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/2/21.
//

import SwiftUI
import PDFKit

struct MainNavigationView: View {
    
    @State private var selection = 0 //set the default tab
    @State private var showCameraModal = false
    
    init() {
//        UITabBar.appearance().backgroundColor = Constants.tabColor
        UITabBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().barTintColor = .systemBackground
//          UITabBar.appearance().unselectedItemTintColor = Constants.tintColor
//       self.selectedTab = selectedTab
      }
    
    let tabBarImageNames = ["checklist", "map.fill", "camera.fill", "questionmark", "person.fill"]
    
    var body: some View {
        VStack(spacing: 0){
            ZStack{
                
                Spacer()
                    .fullScreenCover(isPresented: $showCameraModal, content: {
                        ZStack {
                            AugmentedContentView()
                            Button(action: {showCameraModal.toggle()}, label: {
                                Text("Close")
                            }).position(x: 50, y: 40)
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                        }
                    })
                
                switch selection {
                case 0: //Task View
//                    NavigationView {
                            TaskView(taskContent: TaskViewModel())
//                    }
                case 1:
                    NavigationView {
                        MapView()
                            
                    }
                case 2: //Camera
                    NavigationView {
                        
                    }
                case 3: //Help View
                    NavigationView {
                            HelpView()
                    }
                case 4: //Account View
                    NavigationView {
                        
                        AccountView()
                    }
                default:
                    NavigationView {
                        Text("Error")
                    }
                }
            }
            
//            Spacer()
            
            Divider()
                .padding(.bottom, 8)
            
            HStack {
                ForEach(0..<5) { num in
                    Button(action: {
                        
                        if num == 2 {
                            showCameraModal.toggle()
                            return
                        }
                        
                        selection = num
                    }, label: {
                        Spacer()
                        
                        if num == 2 {
                            ZStack {
                                Image(systemName: tabBarImageNames[num])
                                    .font(.system(size: 52, weight: .bold))
                                    .foregroundColor(Constants.accentColor)
                            //add circle outline for the camera icon?
                            }
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(selection == num ? Constants.tintColor : Constants.accentColor)
                        }
                        
                        Spacer()
                    })
                }
            }
            .padding(.top, 15)
            .background(Constants.customGreen)
        }
    }
}

struct MainNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}

private struct Constants {
    static let tintColor: Color = .black
    static let accentColor: Color = .white
    static let customGreen: Color = Color(hex: "#1BA689")
    static let customDarkGreen: Color = Color(hex: "#326e75")
    static let customBlue: Color = Color(hex: "#41c1c0")
    static let customLightBlue: Color = Color(hex: "#d0ecef")
    static let customOrange: Color = Color(hex: "#fbcbab")
    
}


//
//  MainNavigationView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 11/28/21.
//

// MARK: - Helper Views

struct TopHeader: View {
    
    var currentTab: String //used to pass the current tab name to the header
    
    init(currentTab: String) {
        self.currentTab = currentTab
    }
    
    var body: some View {
        
        VStack(spacing: 25){
            HStack{
                Text(currentTab)
                    .fontWeight(.bold)
                    .font(.system(size: 32))
                    .foregroundColor(.white)
                Spacer(minLength: 0)
                
//                Button(action: { // add image icons here if desired
//
//                })
//                {
//                    Image("") //insert image
//                        .resizable()
//                        .frame(width: 18, height: 18)
//                        .foregroundColor(.white)
//                }
            }
        }
        .padding(.horizontal)
        .padding(.top, 60) //replace magic number
        .background(Constants.customGreen)
        
    }
}

struct NavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationView()
    }
}
