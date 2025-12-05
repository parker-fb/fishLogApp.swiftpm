import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        TabView{
                    
                    HomeView()
                        .tabItem{
                            Image(systemName: "house")
                            
                             Text("Home")
                        }
                    
                    LibraryView()
                        .tabItem{
                            Image(systemName: "books.vertical")
                            
                                Text("Libary")
                        }
            
            
                    
                    AddView()
                        .tabItem{
                            Image(systemName: "plus.app")
                               
                            Text("Add")
                        }
            
//            UserFishView()
//                .tabItem {
//                    Image(systemName: "person.crop.circle")
//                }
            
            StatView()
                .tabItem{
                    Image(systemName: "chart.bar.fill")
                    
                    Text("Analyze")
                }
                    
                    
                    
                    
                }
       // .background(.white)
                .tint(.black)

        
        
        
    }
}
