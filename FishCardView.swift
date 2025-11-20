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
                .font(.headline)
                .padding(.bottom, 5)

            VStack(alignment: .leading, spacing: 20) {
                Text("Fish\(fish.fishName)")
                Text("\(fish.bait)")
                Text("Length: \(fish.length, specifier: "%.1f") in")
                Text(
                    "Weight: \(fish.weight, specifier: "%.2f") \(fish.weightType)"
                )
                Text("Weather: \(fish.weather)")
                Text("Location: \(fish.location)")
            }
            .font(.subheadline)
            .padding(.top, 5)
        }
        .padding()
        .frame(width: 200)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    //SwiftUIView()
}
