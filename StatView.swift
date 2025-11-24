//
//  SwiftUIView.swift
//  fishLogApp
//
//  Created by Jennifer Letak on 11/19/25.
//

import SwiftData
import SwiftUI

struct StatView: View {

    @Query var fishes: [FishInfo]

    @State var score = 0.0

    var body: some View {

        VStack {
            Text("Your Stats")
                .font(Font.largeTitle.bold())
                .foregroundStyle(Color(red: 240/255, green: 233/255, blue: 214/255))
                .padding()
            Divider()
                .fontWeight(.bold)
                .background(Color(red: 240/255, green: 233/255, blue: 214/255))
            Spacer()
            VStack(alignment: .leading, spacing: 20) {
                Text("Most Common Fish\(commonFish())")
                Text("Recommended \(bestBait())")
                Text("Recommended Weather: \(bestWeather())")
                Text("Recommended Location: \(bestLocation())")
            }
            .padding()
            .frame(width: 200)
            .background(Color(red: 240/255, green: 233/255, blue: 214/255))
            .cornerRadius(10)
            .shadow(radius: 2)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(red: 30/255, green: 58/255, blue: 95/255))

    }

    func commonFish() -> String {
        var counts: [String: Int] = [:]
        for fish in fishes {
            counts[fish.fishName, default: 0] += 1
        }
        var mostCommon = "N/A"
        var maxCount = 0
        for (fishName, count) in counts {
            if count > maxCount {
                mostCommon = fishName
                maxCount = count
            }
        }
        return mostCommon
    }

    func bestBait() -> String {
        var bestScore: Double = 0
        var bestBait: String = "N/A"
        for fish in fishes {
            if fish.score() > bestScore {
                bestScore = fish.score()
                bestBait = fish.bait
            }
        }
        return bestBait
    }

    func bestWeather() -> String {
        var bestScore: Double = 0
        var bestWeather: String = "N/A"
        for fish in fishes {
            if fish.score() > bestScore {
                bestScore = fish.score()
                bestWeather = fish.weather
            }
        }
        return bestWeather
    }

    func bestLocation() -> String {
        var bestScore: Double = 0
        var bestLocation: String = "N/A"
        for fish in fishes {
            if fish.score() > bestScore {
                bestScore = fish.score()
                bestLocation = fish.location
            }
        }
        return bestLocation
    }

}

#Preview {
    StatView()
}
