//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Fenston Morris on 16/01/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var turboPackage = false
    @State private var enginePackage = false


    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                }
            }
        )
        
    
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                }
            }
        )
        
        let turboPackageBinding = Binding<Bool> (
            get: { self.turboPackage },
            set: { newValue in
                self.turboPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration += 1.1
                } else {
                    starterCars.cars[selectedCar].acceleration -= 1.1
                }
            }
        )
        
        let enginePackageBinding = Binding<Bool> (
            get: { self.enginePackage },
            set: { newValue in
                self.enginePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration += 0.6
                    starterCars.cars[selectedCar].topSpeed += 10
                } else {
                    starterCars.cars[selectedCar].acceleration -= 0.6
                    starterCars.cars[selectedCar].topSpeed -= 10
                }
            }
        )
        
        
        
        
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("\(starterCars.cars[selectedCar].displayStats())")
            Button("Next Car", action: {
                selectedCar += 1
            })
       
            Toggle("Exhaust Package", isOn: exhaustPackageBinding)
            Toggle("Tires Package", isOn: tiresPackageBinding)
            Toggle("Turbo Package", isOn: turboPackageBinding)
            Toggle("Engine Package", isOn: enginePackageBinding)
        
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
