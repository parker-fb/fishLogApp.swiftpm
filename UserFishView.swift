//
//  SwiftUIView.swift
//  fishLogApp
//
//  Created by Jennifer Letak on 11/19/25.
//

import SwiftData
import SwiftUI

struct UserFishView: View {

    @Query var fishes: [FishInfo]

    @State var columns = [GridItem(.adaptive(minimum: 150), spacing: 16)]

    var body: some View {

        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(fishes, id: \.id) { fish in
                VStack {
                    Image(fish.fishName)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .cornerRadius(10)

                    Text(fish.fishName)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .cornerRadius(8)
            }
        }
    }

}

#Preview {
    UserFishView()
}
