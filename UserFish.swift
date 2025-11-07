//
//  File.swift
//  fishLogApp
//
//  Created by PARKER LETAK on 11/7/25.
//

import Foundation
import SwiftUI


class UserFish{
    
    @State var type: String
    @State var length: Double
    @State var weight: Double
    
    
    init(type: String, length: Double, weight: Double) {
        self.type = type
        self.length = length
        self.weight = weight
    }
    
    init(type: String) {
        self.type = type
        length = 0.0
        weight = 0.0
    }
    
}
