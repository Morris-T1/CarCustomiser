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
    @State private var remainingFunds = 1000
    @State private var remainingTime = 30
    
    var exhaustPackageEnabled: Bool {
        return exhaustPackage ? true : remainingFunds >= 500 ? true : false
    }
    var tiresPackageEnabled: Bool {
        return tiresPackage ? true : remainingFunds >= 500 ? true : false
    }
    var turboPackageEnabled: Bool {
        return turboPackage ? true : remainingFunds >= 500 ? true : false
    }
    var enginePackageEnabled: Bool {
        return enginePackage ? true : remainingFunds >= 1000 ? true : false
    }
    

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()


    var body: some View {
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 500
                }
            }
        )
        
    
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage },
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 500
                }
            }
        )
        
        let turboPackageBinding = Binding<Bool> (
            get: { self.turboPackage },
            set: { newValue in
                self.turboPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration += 1.1
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].acceleration -= 1.1
                    remainingFunds += 500
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
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].acceleration -= 0.6
                    starterCars.cars[selectedCar].topSpeed -= 10
                    remainingFunds += 1000
                }
            }
        )
        
        
        
        VStack {
            Text("\(remainingTime)")
                .onReceive(timer) { _ in
                    if self.remainingTime > 0 {
                        self.remainingTime -= 1
                        if self.remainingTime == 0 {
                            exhaustPackageEnabled = false
                            tiresPackageEnabled = false
                            turboPackageEnabled = false
                            enginePackageEnabled = false
                        }
                    }
                }
                .foregroundColor(.red)
            Form {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    
                    Text("\(starterCars.cars[selectedCar].displayStats())")
                    Button("Next Car", action: {
                        selectedCar += 1
                        resetDisplay()
                    })
                    
                    Toggle("Exhaust Package (Cost: 500)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Tires Package (Cost: 500)", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled)
                    Toggle("Turbo Package (Cost: 500)", isOn: turboPackageBinding)
                        .disabled(!turboPackageEnabled)
                    Toggle("Engine Package (Cost: 1000)", isOn: enginePackageBinding)
                        .disabled(!enginePackageEnabled)
                    
                }
                .padding()
            
            }
            Text("remaining Funds: \(remainingFunds)")
                .foregroundColor(.red)
        }
    }
    func resetDisplay() {
        starterCars = StarterCars()
        exhaustPackage = false
        tiresPackage = false
        turboPackage = false
        enginePackage = false
        remainingFunds = 1000
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
