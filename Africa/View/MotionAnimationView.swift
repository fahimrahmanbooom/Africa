//
//  MotionAnimationView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/28/21.
//

import SwiftUI

struct MotionAnimationView: View {
    
    // properties
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating: Bool = false
    
    // body
    var body: some View {
        
        // geometry reader
        GeometryReader(content: { geometry in
            
            // zstack
            ZStack {
                
                // for each
                ForEach(0...randomCircle, id: \.self) { item in
                    
                    Circle()
                        .foregroundColor(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize(), height: randomSize(), alignment: .center)
                        .scaleEffect(isAnimating ? randomScale() : 1)
                        .position(
                            x: randomCoordinate(max: geometry.size.width),
                            y: randomCoordinate(max: geometry.size.height)
                        )
                        .animation(.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                    .repeatForever()
                                    .speed(randomSpeed())
                                    .delay(randomDelay())
                        )
                        .onAppear(perform: {
                            isAnimating = true
                        })
                } //: for each
            } //: zstack
            .drawingGroup()
        }) //: geometry reader
    }
    
    //MARK: - Functions
    
    // random coordinate
    func randomCoordinate(max: CGFloat) -> CGFloat {
        return CGFloat.random(in: 0...max)
    }
    
    // random size
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 10...300))
    }
    
    // random scale
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    
    // random speed
    func randomSpeed() -> Double {
        return Double.random(in: 0.025...1.0)
    }
    
    // random delay
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
}


struct MotionAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        MotionAnimationView()
    }
}
