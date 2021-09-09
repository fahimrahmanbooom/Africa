//
//  MapAnnotationView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/28/21.
//

import SwiftUI

struct MapAnnotationView: View {
    
    // properties
    
    @State private var animation: Double = 0.0
    
    var location: NationalParkLocation
    
    // body
    var body: some View {
        
        // zstack
        ZStack {
            
            Circle()
                .fill(Color.accentColor)
                .frame(width: 54, height: 54, alignment: .center)
            
            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect( 1 + CGFloat(animation))
                .opacity(1 - animation)
            
            Image(location.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                .clipShape(Circle())
            
        } //: zstact
        .onAppear(perform: {
            
            withAnimation(.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        })
    }
}


struct MapAnnotationView_Previews: PreviewProvider {
    
    static let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    static var previews: some View {
        MapAnnotationView(location: locations.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
