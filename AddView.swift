//
//  SwiftUIView.swift
//  fishLogApp
//
//  Created by Jennifer Letak on 11/6/25.
//

import CoreLocation
import SwiftData
import SwiftUI

struct AddView: View {

    @Environment(\.modelContext) var context

    @StateObject var locVM = LocationViewModel()

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
    @State var fishName = ""

    @FocusState var dismissKeyboard: Bool

    var body: some View {
        VStack {
            Text("Add Fish")
                .font(.system(size: 50))
                .font(.title)
                .fontDesign(.rounded)
                .foregroundStyle(Color(red: 240/255, green: 233/255, blue: 214/255))
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 375, height: 200)
                    .foregroundStyle(Color(red: 113/255, green: 165/255, blue: 112/255))

           
                VStack {
                    HStack {
                        Button {
                            showView = true
                        } label: {
                            Text("Fish\(fishName)")
                                .foregroundStyle(.black)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
            

              
                VStack {
                    HStack {
                        Spacer()
                        Menu {
                            Menu("Live Bait") {
                                Button("Worms") { name = "Bait: Worms" }
                                Button("Minnows") { name = "Bait: Minnows" }
                                Button("Leeches") { name = "Bait: Leeches" }
                                Button("Shrimp") { name = "Bait: Shrimp" }
                                Button("Crawfish") { name = "Bait: Crawfish" }
                            }
                            Menu("Natural") {
                                Button("Chicken") { name = "Bait: Chicken" }
                                Button("Corn") { name = "Bait: Corn" }
                                Button("Cut Fish") { name = "Bait: Cut Fish" }
                                Button("Food") { name = "Bait: Food" }
                            }
                            Menu("Artificial") {
                                Button("Plastic Worms") {
                                    name = "Bait: Plastic Worms"
                                }
                                Button("Jigs") { name = "Bait: Jigs" }
                                Button("Spinner") { name = "Bait: Spinner" }
                                Button("Crankbait") { name = "Bait: Crankbait" }
                                Button("Spoon") { name = "Bait: Spoon" }
                                Button("Topwater") { name = "Bait: Topwater" }
                                Button("Swimbait") { name = "Bait: Swimbait" }
                                Button("Flies") { name = "Bait: Flies" }
                            }
                            Button("Other") {}
                        } label: {
                            Text(name)
                                .foregroundStyle(.black)
                        }
                        .menuOrder(.fixed)
                    }
                    Spacer()
                }
                .padding()

            
                VStack {
                    Spacer()
                    HStack {
                        HStack(spacing: 2) {
                            Text("Length:")
                            TextField("0.0", text: $Slength)
                                .keyboardType(.decimalPad)
                                .focused($dismissKeyboard)
                                .frame(width: 30)
                            Text("in").opacity(0.6)
                        }
                        Spacer()
                    }
                    Spacer()
                }
                .padding(.leading, 10)

             
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            showCal = true
                        } label: {
                            HStack(spacing: 2) {
                                Text(
                                    date.formatted(
                                        .dateTime.month(.abbreviated).day()
                                    )
                                )
                                .foregroundColor(.black)
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(.black)
                            }
                            .padding(8)
                            .background(.gray.opacity(0.2))
                            .cornerRadius(8)
                        }
                        Spacer()
                    }
                    Spacer()
                }

            
                VStack {
                    Spacer()
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
                            HStack(spacing: 2) {
                                Text(w)
                                    .foregroundStyle(.black)
                                Image(systemName: "chevron.down")
                                    .foregroundStyle(.black)
                            }
                        }
                    }
                    .padding(.trailing, 10)
                    Spacer()
                }

               
                VStack {
                    Spacer()
                    HStack {
                        HStack(spacing: 2) {
                            Text("Weight:")
                            TextField("0.00", text: $Sweight)
                                .keyboardType(.decimalPad)
                                .focused($dismissKeyboard)
                                .frame(width: 40)
                            Menu {
                                Button("lbs") {
                                    type = "lbs"
                                }
                                Button("oz") {
                                    type = "oz"
                                }
                            } label: {
                                HStack(spacing: 2) {
                                    Text("\(type)")
                                        .foregroundStyle(.black)
                                        .opacity(0.6)
                                    Image(systemName: "chevron.down")
                                        .foregroundStyle(.black)
                                        .font(.system(size: 11))
                                        .opacity(0.6)
                                }
                            }
                        }
                        Spacer()
                    }
                    .padding(.leading, 10)
                }
                .padding(.bottom)

               
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Text("Location: \(locVM.locString)")

                    }
                    .padding(.trailing, 10)
                }
                .padding(.bottom)
            }
            .frame(width: 375, height: 200)

            VStack {
                Button {
                    if let length = Double(Slength),
                        let weight = Double(Sweight)
                    {
                        let newFish = FishInfo(
                            fishName: fishName,
                            bait: name,
                            length: length,
                            weight: weight,
                            weightType: type,
                            date: date,
                            weather: w,
                            location: locVM.locString
                        )
                        context.insert(newFish)
                        try? context.save()

                        fishName = ""
                        name = "Bait"
                        Slength = ""
                        Sweight = ""
                        type = "lbs"
                        w = "Weather"
                        
                        

                    }
                    
                    dismissKeyboard = false

                } label: {
                    Text("Add")
                        .foregroundStyle(.black)
                        .bold()
                        .padding(.horizontal, 10)
                        .padding(.vertical, 1)
                        .background(Color(red: 179/255, green: 229/255, blue: 252/255))
                        .clipShape(Capsule())
                        .cornerRadius(20)
                        
                }
                .padding(.horizontal, 50)
                .padding(.top, 10)
            }

        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 60/255, green: 100/255, blue: 150/255))

        .popover(isPresented: $showView) {
            FishCollectionView(showView: $showView, fishName: $fishName)
        }

      

        .onTapGesture {
            dismissKeyboard = false
        }
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
            .padding()
        }
    }
}

#Preview {
    AddView()
}
