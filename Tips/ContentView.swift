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
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Check Amount", text: $checkAmount)
                
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
