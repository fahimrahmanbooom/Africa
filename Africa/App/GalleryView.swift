//
//  GalleryView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/19/21.
//

import SwiftUI

struct GalleryView: View {
    
    // properties
    @State private var selectedAnimal: String = "lion"
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Double = 3.0
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // body
    var body: some View {
        // scroll view
        ScrollView(.vertical, showsIndicators: false, content: {
            // vstack
            VStack(alignment: .center, spacing: 30) {
                // image
                Image(selectedAnimal)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 8))
                
                // slider
                Slider(value: $gridColumn, in: 2...4, step: 1)
                    .padding()
                    .onChange(of: gridColumn, perform: { value in
                        gridSwitch()
                    })
                
                // grid
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                    // for each
                    ForEach(animals) { item in
                        
                        Image(item.image)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .onTapGesture {
                                selectedAnimal = item.image
                                haptics.impactOccurred()
                            }
                    } //: for each
                }) //: grid
                .animation(.easeIn)
                .onAppear(perform: {
                    gridSwitch()
                })
            } //: vstack
            .padding(.horizontal, 10)
            .padding(.vertical, 50)
        }) //: scroll view
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(MotionAnimationView())
    }
    
    // grid switch
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
    }
}


struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
