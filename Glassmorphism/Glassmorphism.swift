//
//  ContentView.swift
//  Glassmorphism
//
//  Created by Jake Davies on 04/08/2021.
//

import SwiftUI

struct Glassmorphism: View {
    @State private var loadImagePressed = false
    @State private var image = Image("4kImage")
    
    // for the gradient of the card
    @State private var color1: Color = .red
    @State private var color2: Color = .blue
    
    @State private var rotation = CGSize.zero
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                self.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .blur(radius: 15)
                    .scaleEffect(1.1)
                
                VStack {
                    Spacer()
                    
                    glassCard
                        .frame(width: geo.size.width * 0.70,
                                    height: geo.size.height * 0.60)
                        
                        .rotation3DEffect(.degrees(Double(rotation.width * 0.6)),
                                          axis: (x: 0.0, y: 1.0, z: 0.0))
                        .rotation3DEffect(.degrees(Double(rotation.height * -0.3)),                   axis: (x: 1.0, y: 0.0, z: 0.0))
                        
                        .onTapGesture {
                            self.colorChange()
                        }
                        .gesture(DragGesture()
                                    .onChanged { value in
                                        rotation = value.translation
                                    }
                                    
                                    .onEnded { value in
                                        rotation = CGSize.zero
                                    })
                        .animation(.spring())
                    
                    Spacer()
                    
                    button
                        .frame(width: geo.size.width * 0.8)
                        .padding()
                }
            }
            .frame(width: geo.size.width)
            .sheet(isPresented: $loadImagePressed, content: {
                ImageSelector(processImage: handleImage)
            })
        }
    }
    
    private var button: some View {
        Button("Load Image") {
            loadImagePressed = true
        }
        .padding()
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
    }
    
    private var card: some View {
        Rectangle()
            .fill(LinearGradient(gradient:
                                    Gradient(
                                        colors: [color1, color2]),
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
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding()
            
            Spacer()
            Text("Tap to change color")
                .padding(.vertical)
        }
    }
    
    private func colorChange() {
        let colors: [Color] = [.red, .blue, .green, .yellow, .pink, .orange,
                               .purple]
        
        self.color1 = colors.randomElement() ?? .red
        self.color2 = colors.randomElement() ?? .blue
        
        if self.color1 == self.color2 {
            self.colorChange()
        }
    }
    
    private func handleImage(_ image: UIImage?) {
        if let imageData = image?.jpegData(compressionQuality: 1.0) {
            self.image = Image(uiImage: UIImage(data: imageData)!)
        }
        self.loadImagePressed = false
    }
}

struct Glassmorphism_Previews: PreviewProvider {
    static var previews: some View {
        Glassmorphism()
    }
}
