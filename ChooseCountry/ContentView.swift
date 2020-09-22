//
//  ContentView.swift
//  ChooseCountry
//
//  Created by KAVIRAJ PANDEY on 19/09/20.
//  Copyright © 2020 KAVIRAJ PANDEY. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var answer = false
    var body: some View {
        Button("Click Me!") {
            self.answer = true
    }
        .alert(isPresented: $answer) {
            Alert(title: Text("Shutdown your phone!"), message: Text("Hello Kaviraj Please try again later"), dismissButton: .default(Text("OK")))
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
}
