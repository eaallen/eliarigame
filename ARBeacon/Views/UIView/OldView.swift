//import SwiftUI
//
//struct MainNavigationView: View {
//
////    @ObservedObject var appContent: AppSetupVM
//    @State private var selection = 1 //set the default tab
////    @State var selectedTab: String
//
//    init() {
//        UITabBar.appearance().backgroundColor = Constants.tabColor
//          UITabBar.appearance().tintColor = Constants.tintColor
//          UITabBar.appearance().unselectedItemTintColor = Constants.tintColor
////          self.selectedTab = selectedTab
//      }
//
//    var body: some View {
//        VStack {
//            ZStack {
//                switch selection {
//                case 1:
//                    NavigationView {
//                        Text("Tasks")
//                            .navigationTitle("Tasks")
//                    }
//                default:
//                    Text("Error")
//                }
//
//
//
//                TabView(selection: $selection) {
//                    TaskView(taskContent: TaskViewModel()) //change this view to the view that corresponds to the navitgation bar item
//                        .tabItem {
//                            Label("Tasks", systemImage: "checklist")
//                        }
//                        .tag(1)
//
//                    QRCodeScannerView()
//                        .tabItem {
//                            Label("Map", systemImage: "map")
//                        }
//                        .tag(2)
//
//                    AugmentedContentView()
//                        .tabItem {
//                            Label("Camera", systemImage: "camera")
//                        }
//                        .tag(3)
//
//                    HelpView()
//                        .tabItem {
//                            Label("Help", systemImage: "questionmark")
//                        }
//                        .tag(4)
//
//                    AccountView()
//                        .tabItem {
//                            Label("Account", systemImage: "person")
//                        }
//                        .tag(5)
//                }
//                .accentColor(Constants.accentColor) //the current tab will show this color
//                //ignore safe edges here?
//            }
//            .edgesIgnoringSafeArea(.all)
//        }
//    }
//}
//
//private struct Constants {
//    static let accentColor: Color = .black
//    static let tintColor: UIColor = .white
//    static let tabColor: UIColor = UIColor(hex: "#1BA689")
//    static let headerColor: Color = Color(hex: "#1BA689")
//}
//
