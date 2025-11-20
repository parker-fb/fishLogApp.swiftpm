//
//  SwiftUIView.swift
//  fishLogApp
//
//  Created by Jennifer Letak on 11/6/25.
//

import SwiftData
import SwiftUI

struct LibraryView: View {

    @Query var fishes: [FishInfo]

    var body: some View {

        ScrollView {
            Text("Your Fish")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Sort by: Most Recent")
                .font(.caption)
            VStack(spacing: 20) {
                ForEach(fishes, id: \.id) { fish in
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.tertiary)
                            .frame(width: 375, height: 200)

                       
                        VStack {
                            HStack {
                                Text("Fish\(fish.fishName)")
                                    .foregroundStyle(.black)
                                Spacer()
                            }
                            Spacer()
                        }
                        .padding()

                      
                        VStack {
                            HStack {
                                Spacer()
                                Text(fish.bait)
                                    .foregroundStyle(.black)
                            }
                            Spacer()
                        }
                        .padding()

                    
                        VStack {
                            Spacer()
                            HStack {
                                HStack(spacing: 2) {
                                    Text("Length:")
                                    Text("\(fish.length, specifier: "%.2f")")
                                        .frame(width: 40)
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
                                Text(
                                    fish.date.formatted(
                                        .dateTime.month(.abbreviated).day()
                                    )
                                )
                                .padding(8)
                                .background(.gray.opacity(0.2))
                                .cornerRadius(8)
                                Spacer()
                            }
                            Spacer()
                        }

                
                        VStack {
                            Spacer()
                            HStack {
                                Spacer()
                                Text(fish.weather)
                                    .foregroundStyle(.black)
                            }
                            .padding(.trailing, 10)
                            Spacer()
                        }

               
                        VStack {
                            Spacer()
                            HStack {
                                HStack(spacing: 2) {
                                    Text("Weight:")
                                    Text("\(fish.weight, specifier: "%.2f")")
                                        .frame(width: 40)
                                    Text(fish.weightType).opacity(0.6)
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
                                Text("Location: \(fish.location)")
                            }
                            .padding(.trailing, 10)
                        }
                        .padding(.bottom)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    LibraryView()
}
