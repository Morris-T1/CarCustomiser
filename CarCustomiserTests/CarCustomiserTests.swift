//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Fenston Morris on 16/01/2023.
//

import XCTest


final class CarCustomiserTests: XCTestCase {
    
    func testNewCarGivesMeACarWithAllAttributesSet() {
        //arrange
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling:5)
        //assert
        XCTAssertEqual(car.make, "Mazda")
        XCTAssertEqual(car.model, "MX-5")
        XCTAssertEqual(car.topSpeed, 125)
        XCTAssertEqual(car.acceleration, 7.7)
        XCTAssertEqual(car.handling, 5)

    }
    
    
    func testDisplayStatsOfCar() {
        let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling:5)
        let expected = """
        Make: Mazda
        Model: MX-5
        Top Speed: 125
        Acceleration: 7.7
        Handling: 5
        """
        
        let actual = car.displayStats()
        
        XCTAssertEqual(actual, expected)
    }
                
        
        
        
     
        
        
        
    }

    

