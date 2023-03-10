//
//  Car.swift
//  CarCustomiser
//
//  Created by Fenston Morris on 16/01/2023.
//

import Foundation


struct Car {
    let make: String
    let model: String
    var topSpeed: Int
    var acceleration: Double
    var handling: Int
    
    func displayStats() -> String {
        
        return """
            Make: \(make)
            Model: \(model)
            Top Speed: \(topSpeed)
            Acceleration: \(acceleration)
            Handling: \(handling)
            """
        
        
    }
}
