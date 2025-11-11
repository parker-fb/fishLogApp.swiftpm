//
//  SwiftUIView.swift
//  fishLogApp
//
//  Created by Jennifer Letak on 11/6/25.
//

import SwiftUI

struct AddView: View {

    @State var weather = 0
    @State var w = "Weather"
    @State var name = "Bait"
    @State var date = Date()
    @State private var showCal = false
    @State var showView = false
    @State var Slength = ""
    @State var len = 0.0
    @State var Sweight = ""
    @State var weight = 0.0
    @State var type = "lbs"
//    @State var oz = ""
//    @State var lbs = ""

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 375, height: 200)
                .foregroundStyle(.tertiary)

            
            
            VStack{
                
                HStack{
                    Button {
                        showView = true
                    } label: {
                        Text("Fish")
                            .foregroundStyle(.black)
                    }
                    
                    Spacer()
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical)
            .frame(width: 375, height: 200)
            
            
            .popover(isPresented: $showView) {
                FishCollectionView(showView: $showView)
            }
            
            HStack{
                Text("Length: ")
                    TextField("0.0 ", text: $Slength)
                        .keyboardType(.numberPad)
                        .padding(-5)
                Spacer()
                    
            }
            .padding(.horizontal)
            .frame(width: 375, height: 200)
            
            HStack{
                Text("in")
                    .opacity(0.6)
                Spacer()
            }
            .frame(width: 157)
            
            VStack{
                Spacer()
                HStack{
                    Text("Weight: ")
                    TextField("0.00", text: $Sweight)
                        .keyboardType(.numberPad)
                        .padding(-5)
                    Spacer()
                }
                .padding(.horizontal)
            }
            .padding(.vertical)
            .frame(width: 375, height: 200)
           
            
            VStack{
                
                Spacer()
                
                HStack{
                    
                    Menu{
                        
                        Button("lbs"){
                            type = "lbs"
                        }
                        Button("oz"){
                            type = "oz"
                        }
                        
                    } label: {
                        
                        HStack{
                            Text("\(type)")
                                .foregroundStyle(.black)
                                .opacity(0.6)
                            Image(systemName: "chevron.down")
                                .font(Font.system(size: 11))
                                .opacity(0.6)
                                .padding(-5)
                                .foregroundStyle(.black)
                        }
                    }
                    
                    Spacer()
                    
                }
            }
            .frame(width: 132, height: 168)
            
            
            
            
            
            
            
            
            VStack {

                HStack {
                    Spacer()
                    Menu {

                        Menu("Live Bait") {

                            Button("Worms") {
                                name = "Bait: Worms"
                            }
                            Button("Minnows") {
                                name = "Bait: Minnows"
                            }
                            Button("Leeches") {
                                name = "Bait: Leeches"
                            }
                            Button("Shrimp") {
                                name = "Bait: Shrimp"
                            }
                            Button("Crawfish") {
                                name = "Bait: Crawfish"
                            }

                        }

                        Menu("Natural") {

                            Button("Chicken") {
                                name = "Bait: Chicken"
                            }
                            Button("Corn") {
                                name = "Bait: Corn"
                            }
                            Button("Cut Fish") {
                                name = "Bait: Cut Fish"
                            }
                            Button("Food") {
                                name = "Bait: Food"
                            }

                        }

                        Menu("Artificial") {

                            Button("Plastic Worms") {
                                name = "Bait: Plastic Worms"
                            }
                            Button("Jigs") {
                                name = "Bait: Jigs"
                            }
                            Button("Spinner") {
                                name = "Bait: Spinner"
                            }
                            Button("Crankbait") {
                                name = "Bait: Crankbait"
                            }
                            Button("Spoon") {
                                name = "Bait: Spoon"
                            }
                            Button("Topwater") {
                                name = "Bait: Topwater"
                            }
                            Button("Swimbait") {
                                name = "Bait: Swimbait"
                            }
                            Button("Flies") {
                                name = "Bait: Flies"
                            }

                        }

                        Button("Other") {

                        }
                    } label: {
                        Text(name)
                            .foregroundStyle(.black)
                    }
                    .menuOrder(.fixed)
                }
                Spacer()
            }
            .padding(.horizontal)
            .padding(.vertical)
            .frame(width: 375, height: 200)

            HStack {
                Spacer()
                Menu {
                    Button("Sunny") {
                        weather = 1
                        w = "Sunny"
                    }
                    Button("Rain") {
                        weather = 2
                        w = "Rain"
                    }
                    Button("Cloudy") {
                        weather = 3
                        w = "Cloudy"
                    }
                } label: {
                    HStack {
                        Text(w)
                            .foregroundStyle(.black)
                        Image(systemName: "chevron.down")
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal)
            }
            .frame(width: 375, height: 200)

            //            DatePicker(
            //                "Date", selection: $date, displayedComponents: [.date]
            //            )
            //            .datePickerStyle(.compact)

            Button{
                showCal = true
            } label: {
                HStack {
                    Text(date.formatted(.dateTime.month(.abbreviated).day()))
                        .foregroundColor(.black)
                        .frame(width: 55, height: 10)
                    Image(systemName: "chevron.down")
                        .foregroundStyle(.black)
                }
                .padding()
                .background(.gray.opacity(0.2))
                .cornerRadius(8)
            }

            Spacer()
        }
        .padding()
        
        .sheet(isPresented: $showCal) {
            VStack {
                DatePicker(
                    "Select Date",
                    selection: $date,
                    displayedComponents: [.date]
                )
                .datePickerStyle(GraphicalDatePickerStyle())

                Button("Done") {
                    showCal = false
                }
            }

        }

        
        
        Button {
            
            if let l = Double(Slength){
                len = l
            }
            
        } label: {
            Text("Add")
        }

        
        

        
    }
}


#Preview {
    AddView()
}
