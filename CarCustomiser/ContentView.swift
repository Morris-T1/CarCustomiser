//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Fenston Morris on 16/01/2023.
//

import SwiftUI

struct ContentView: View {
    let starterCars = StarterCars()
    @State private var selectedCar: Int = 0
    
    let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling:5)
    
    
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            Text("\(starterCars.cars[selectedCar].displayStats())")
            Button("Random car", action: {
                selectedCar = Int.random(in: 0 ..<
                    self.starterCars.cars.count)
            })
          
        
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
