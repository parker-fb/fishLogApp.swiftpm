//
//  File.swift
//  fishLogApp
//
//  Created by PARKER LETAK on 11/7/25.
//

import Foundation
import SwiftUI

class ComputerFish: Identifiable{
    
    @State var id = UUID()
    @State var name: String
    @State var img: String
    
    
    
    
    init(name: String, img: String) {
        self.name = name
        self.img = img
    }
    
    
    
    
    
}
