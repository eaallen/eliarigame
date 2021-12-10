//
//  MainView.swift
//  ARBeacon
//
//  Created by Seth Erickson on 12/2/21.
//

import SwiftUI
import PDFKit

struct MainNavigationView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var selection = 0 //set the default tab
    @State private var showCameraModal = false
    
    init() {
//        UITabBar.appearance().backgroundColor = Constants.tabColor
        UITabBar.appearance().barTintColor = .systemBackground
        UINavigationBar.appearance().barTintColor = .systemBackground
//          UITabBar.appearance().unselectedItemTintColor = Constants.black
//       self.selectedTab = selectedTab
      }
    
    let tabBarImageNames = ["checklist", "map.fill", "camera.fill", "questionmark", "person.fill"]
    
    var body: some View {
        
        // MARK: - Tab Navigation Bars
        VStack(spacing: 0){
            ZStack{
                Spacer()
                    .fullScreenCover(isPresented: $showCameraModal, content: {
                        ZStack {
                            IBeaconView()
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
                            TaskView(taskContent: ReadData())
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
            
            Divider()
//                .padding(.bottom, 8)
            
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
                                Image(systemName: tabBarImageNames[num]) //dynamically set system image
                                    .font(.system(size: 52, weight: .bold))
                                    .foregroundColor(Constants.white)
                            //add circle outline for the camera icon?
                            }
                        } else {
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(selection == num ? Constants.black : Constants.white)
                        }
                        
                        Spacer()
                    })
                }
            }
            .padding(.top, 15)
            .background(Constants.customGreen)
        } // end of VStack
            .navigationBarTitle("") //this must be empty
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
    } // end of body View
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
            HStack(alignment: .center){
                Text(currentTab)
                    .fontWeight(.bold)
                    .font(.system(size: 32))
                    .foregroundColor(Constants.white)
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

