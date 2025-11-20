//
//  SwiftUIView.swift
//  fishLogApp
//
//  Created by Jennifer Letak on 11/6/25.
//

import SwiftData
import SwiftUI

struct HomeView: View {

    @Query var fishes: [FishInfo]

    var body: some View {
        
        VStack{
        VStack{
            Text("iFish")
                .font(.largeTitle.bold())
                .fontWidth(.expanded)
        }
        
        HStack {
            if let best = best() {
                FishCardView(fish: best, title: "Best Catch")
            }
            
            if let recent = mostRecent() {
                FishCardView(fish: recent, title: "Most Recent Catch")
            }
        }
    }
    }

    func mostRecent() -> FishInfo? {
        if fishes.isEmpty {
            return nil
        }

        var latest = fishes[0]
        for fish in fishes {
            if fish.date > latest.date {
                latest = fish
            }
        }
        return latest
    }

    func best() -> FishInfo? {

        if fishes.isEmpty {
            return nil
        }

        var best = fishes[0]
        var highestScore = best.weight * (best.length * 0.5)
        for fish in fishes {
            let score = fish.weight * (fish.length * 0.5)
            if score > highestScore {
                highestScore = score
                best = fish
            }
        }
        return best

    }

}

#Preview {
    HomeView()
}
