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

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .frame(width: 375, height: 200)
                .foregroundStyle(.tertiary)

            
            
            
            
            
            
            
            
            
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

        

        
    }
}


#Preview {
    AddView()
}
