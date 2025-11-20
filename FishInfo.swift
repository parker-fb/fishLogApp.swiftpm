//
//  FishInfo.swift
//  fishLogApp
//
//  Created by Jennifer Letak on 11/19/25.
//

import Foundation
import SwiftUI
import SwiftData

@Model
class FishInfo{
    
    //@Attribute(.unique) var id: UUID = UUID()
    
    var fishName: String
       var bait: String
       var length: Double
       var weight: Double
       var weightType: String
       var date: Date
       var weather: String
       var location: String
    
    
    init(fishName: String, bait: String, length: Double, weight: Double, weightType: String, date: Date, weather: String, location: String) {
        self.fishName = fishName
        self.bait = bait
        self.length = length
        self.weight = weight
        self.weightType = weightType
        self.date = date
        self.weather = weather
        self.location = location
    }
    
    
    
    func score() -> Double {
        return weight * (length * 0.5)
    }
    
}
