//
//  SwiftUIView.swift
//  fishLogApp
//
//  Created by PARKER LETAK on 11/7/25.
//

import SwiftUI

struct FishCollectionView: View {
    
    //let fish = ["bass","catfish","tuna"]
    @State var columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State var selectedName = ""
    
    @State var fishList = [
        ComputerFish(name: "Bass", img: "bass"),
        ComputerFish(name: "Catfish", img: "catfish"),
        ComputerFish(name: "Tuna", img: "tuna2")
    ]
    
    @Binding var showView: Bool
    
    @State var libFish: [ComputerFish] = []
    
    @State var fish: ComputerFish?
    
    var body: some View {
        
        
        HStack{
            if !selectedName.isEmpty{
                Text("Select \(selectedName)?")
                
                Button {
                    libFish.append(ComputerFish(name: fish!.name, img: fish!.img))
                    for i in 0..<libFish.count{
                        print(libFish[i].name)
                    }
                 showView = false
                } label: {
                 Text("Yes")
               }
            }
            
            
//

        }
        
        LazyVGrid(columns: columns){
            ForEach(fishList){ f in
                Button{
                    //print("\(f.name)")
                    selectedName = f.name
                    fish = f
                } label: {
                    
                    
                    VStack{
                        Image("\(f.img)")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(8)
                        Text(f.name)
                    }
                    .padding()
                    .frame(width: 200, height: 215)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                }
                
                
            }
        }
        
        
        
    }
}

#Preview {
    FishCollectionView(showView: .constant(false))
}
