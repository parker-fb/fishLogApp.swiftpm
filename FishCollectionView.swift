//
//  SwiftUIView.swift
//  fishLogApp
//
//  Created by PARKER LETAK on 11/7/25.
//

import SwiftUI

struct FishCollectionView: View {
    
    //let fish = ["bass","catfish","tuna"]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State var fishList = [
        ComputerFish(name: "Bass", img: "bass"),
        ComputerFish(name: "Catfish", img: "catfish"),
        ComputerFish(name: "Tuna", img: "tuna2")
    ]
    
    var body: some View {
        
        
        LazyVGrid(columns: columns){
            ForEach(fishList){ f in
                Button{
                    print("tapped")
                } label: {
                    
                    
                    VStack{
                        Image("\(f.img)")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                        Text(f.name)
                    }
                    .padding()
                    .frame(width: 200, height: 225)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                
                
            }
        }
        
        
        
    }
}

#Preview {
    FishCollectionView()
}
