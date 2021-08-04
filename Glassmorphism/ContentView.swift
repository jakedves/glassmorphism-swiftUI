//
//  ContentView.swift
//  Glassmorphism
//
//  Created by Jake Davies on 04/08/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var loadImagePressed = false
    
    var body: some View {
        VStack {
            Text("Hi")
            button
        }
    }
    
    private var button: some View {
        Button("Load Image") {
            loadImagePressed = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
