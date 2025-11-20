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
        ComputerFish(name: "Tuna", img: "tuna2"),
        ComputerFish(name: "Trout", img: "trout"),
        ComputerFish(name: "Walleye", img: "walleye"),
        ComputerFish(name: "Pike", img: "pike"),
        ComputerFish(name: "Muskie", img: "muskie"),
        ComputerFish(name: "Crappie", img: "crappie"),
        ComputerFish(name: "Bluegill", img: "bluegill"),
        ComputerFish(name: "Sunfish", img: "sunfish"),
        ComputerFish(name: "Perch", img: "perch"),
        ComputerFish(name: "Redfish", img: "redfish"),
        ComputerFish(name: "Snook", img: "snoook"),
        ComputerFish(name: "Flounder", img: "flounder"),
        ComputerFish(name: "Snapper", img: "snapper"),
        ComputerFish(name: "Grouper", img: "grouper"),
        ComputerFish(name: "Kingfish", img: "kingfish"),
        ComputerFish(name: "Bluefish", img: "bluefish"),
        ComputerFish(name: "Carp", img: "carp"),
        ComputerFish(name: "Salmon", img: "salmon"),
        ComputerFish(name: "Minnow", img: "minn")
    ]

    @Binding var showView: Bool
    @Binding var fishName: String

    @State var libFish: [ComputerFish] = []

    @State var fish: ComputerFish?

    var body: some View {
        
        HStack {
            if !selectedName.isEmpty {
                Text("Select \(selectedName)?")
                    .padding()
                
                Button {
                    fishName = ": \(fish!.name)"
                    libFish.append(
                        ComputerFish(name: fish!.name, img: fish!.img)
                    )
                    for i in 0..<libFish.count {
                        print(libFish[i].name)
                    }
                    showView = false
                } label: {
                    Text("Yes")
                }
            }
            
            //
            
        }
        
        ScrollView{
        LazyVGrid(columns: columns) {
            ForEach(fishList) { f in
                Button {
                    //print("\(f.name)")
                    selectedName = f.name
                    fish = f
                } label: {
                    
                    VStack {
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
}

#Preview {
    FishCollectionView(showView: .constant(false), fishName: .constant(""))
}
