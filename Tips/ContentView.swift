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
    var grandTotal : Double {
        let amount = Double(checkAmount) ?? 0
        return tip + amount
    }
    var tip : Double {
        let amount = Double(checkAmount) ?? 0
        let percentage = Double(tipPercentages[tipPercentage])
        return (amount / 100.0) * percentage
    }
    var amountPerPerson : Double {
        return grandTotal / Double(numberOfPeople + 2)
    }
    
    var body: some View {
        NavigationView {
                Form {
                    VStack(alignment: .leading, spacing: 20){
                        
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
                    }
                    
                    Section(header: Text("Summary").font(.headline)) {
                    VStack(alignment: .leading) {
                        Text("Total: \(checkAmount)")
                            .padding(.bottom)
                        Text("Tip: (\(tipPercentages[tipPercentage])%): \(tip, specifier: "%.2f")")
                            .padding(.bottom)
                        Text("Grand Total: $\(grandTotal, specifier: "%.2f")")
                            .padding(.bottom)
                        Text("Number Of People: \(numberOfPeople + 2)")
                            .padding(.bottom)
                        Text("$\(amountPerPerson, specifier: "%.2f") per person" )
                            .font(.largeTitle)
                        }
                    }
                }
                .navigationBarTitle("Tips")
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
