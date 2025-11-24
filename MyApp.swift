import SwiftUI
import SwiftData

@main
struct MyApp: App {
    
    init() {
           let appearance = UITabBarAppearance()
           appearance.configureWithOpaqueBackground()

           UITabBar.appearance().tintColor = UIColor.black
           UITabBar.appearance().unselectedItemTintColor = UIColor.white
        
        appearance.backgroundColor = UIColor(
            red: 245/255,
                    green: 238/255,
                    blue: 220/255,
                    alpha: 1
        )
           //appearance.backgroundColor = UIColor.systemBlue

           UITabBar.appearance().standardAppearance = appearance
           UITabBar.appearance().scrollEdgeAppearance = appearance
        
       }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: FishInfo.self)
        }
        
       
    }
}
