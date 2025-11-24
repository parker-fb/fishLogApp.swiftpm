import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        TabView{
                    
                    HomeView()
                        .tabItem{
                            Image(systemName: "house")
                             
                        }
                    
                    LibraryView()
                        .tabItem{
                            Image(systemName: "books.vertical")
                                
                        }
            
            
                    
                    AddView()
                        .tabItem{
                            Image(systemName: "plus.app")
                               
                        }
            
//            UserFishView()
//                .tabItem {
//                    Image(systemName: "person.crop.circle")
//                }
            
            StatView()
                .tabItem{
                    Image(systemName: "chart.bar.fill")
                }
                    
                    
                    
                    
                }
       // .background(.white)
                .tint(.black)

        
        
        
    }
}
