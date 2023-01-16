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
    
    func displayStats(Car) {
        
        let output = """
                    ("Car Make": \(make)
                    ("Car Model": \(model)
                    ("Car topSpeed": \(topSpeed)
                    ("Car acceleration": \(acceleration)
                    ("Car Handling": \(handling)
                    """
        
        return output
    }
}
