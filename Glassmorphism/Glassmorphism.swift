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
            Image("4kImage")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
                .blur(radius: 15)
            
            VStack {
                Spacer()
                glassCard
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
        .background(Color(UIColor.secondaryLabel))
        .cornerRadius(12)
    }
    
    // An exmaple card
    private var glassCard: some View {
        ZStack {
            // This is the card
            card
                .opacity(0.6)
                .shadow(color: .black.opacity(0.3), radius: 10, x: 10, y: 10)
                .shadow(color: .black.opacity(0.3), radius: 10, x: -10, y: -10)
            
            cardContent
        }
        .frame(width: 350, height: 550)
        
    }
    
    private var card: some View {
        Rectangle()
            .fill(LinearGradient(gradient:
                                    Gradient(
                                        colors: [Color.red, Color.blue]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing))
            .cornerRadius(20)
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

struct Glassmorphism_Previews: PreviewProvider {
    static var previews: some View {
        Glassmorphism()
    }
}
