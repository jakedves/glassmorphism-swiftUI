//
//  ContentView.swift
//  Glassmorphism
//
//  Created by Jake Davies on 04/08/2021.
//

import SwiftUI

struct Glassmorphism: View {
    @State private var loadImagePressed = false
    
    var body: some View {
        ZStack {
            Image("")
            
            VStack {
                Spacer()
                card
                Spacer()
                button
            }
        }
    }
    
    private var button: some View {
        Button("Load Image") {
            loadImagePressed = true
        }
        .padding(.vertical)
        .padding(.horizontal, 140)
        .background(Color(UIColor.quaternaryLabel))
        .cornerRadius(12)
    }
    
    // An exmaple card
    private var card: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.red)
                .cornerRadius(20)
            
            cardContent
        }
        .frame(width: 350, height: 550, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
    
    private var cardContent: some View {
        VStack {
            HStack {
                Text("Example Card")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(30)
                Spacer()
            }
            
            Spacer()
            
            Text("This card is used to demonstrate the glassmorphism effect.")
                .font(/*@START_MENU_TOKEN@*/.title2/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Glassmorphism()
    }
}
