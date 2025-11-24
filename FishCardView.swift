//
//  SwiftUIView.swift
//  fishLogApp
//
//  Created by Jennifer Letak on 11/20/25.
//

import SwiftUI

struct FishCardView: View {
    var fish: FishInfo
    var title: String

    var body: some View {
        VStack {
            Text(title)
                .foregroundStyle(.black)
                .font(.headline)
                .padding(.bottom, 5)

            VStack(alignment: .leading, spacing: 20) {
                Text("Fish\(fish.fishName)")
                    .foregroundStyle(.black)

                Text("\(fish.bait)")
                    .foregroundStyle(.black)

                Text("Length: \(fish.length, specifier: "%.1f") in")
                    .foregroundStyle(.black)

                Text(
                    "Weight: \(fish.weight, specifier: "%.2f") \(fish.weightType)"
                )
                .foregroundStyle(.black)

                Text("Weather: \(fish.weather)")
                    .foregroundStyle(.black)

                Text("Location: \(fish.location)")
                    .foregroundStyle(.black)
            }
            .font(.subheadline)
            .padding(.top, 5)
        }
        .padding()
        .frame(width: 200)
        .background((Color(red: 240/255, green: 233/255, blue: 214/255)))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    //SwiftUIView()
}
