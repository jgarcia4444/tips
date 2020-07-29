//
//  ContentView.swift
//  Tips
//
//  Created by Jake Garcia on 7/28/20.
//  Copyright © 2020 Jake Garcia. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var checkAmount = ""
    @State var numberOfPeople = 2
    @State var tipPercentage = 2
    let tipPercentages = [0, 10, 15, 20, 25]
    var amountPerPerson : Double {
        return 0.0
    }
    
    var body: some View {
            NavigationView {
                Form {
                    Section {
                        TextField("Check Amount", text: $checkAmount)
                            .keyboardType(.decimalPad)
                        Picker("Amount of People", selection: $numberOfPeople) {
                            ForEach(2..<21) {
                                Text("\($0) people")
                            }
                        }
                    }
                    
                    Section(header: Text("What tip percentage do you want to apply?")) {
                        Picker("Tip Percentage", selection: $tipPercentage) {
                            ForEach(0..<tipPercentages.count) {
                                Text("\(self.tipPercentages[$0])%")
                            }
                        }
                    .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Text("$\(amountPerPerson, specifier: "%.2f")" )
                }
                .navigationBarTitle("Tips")
            }
            .edgesIgnoringSafeArea(.all)
            
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
