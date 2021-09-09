//
//  InsetFactView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/20/21.
//

import SwiftUI

struct InsetFactView: View {
    
    // properties
    let animal: Animal
    
    // body
    var body: some View {
        
        // groupbox
        GroupBox {
            
            TabView {
                
                // foreach
                ForEach(animal.fact, id: \.self) { item in
                    
                    Text(item)
                    
                } //: foreach
                
            } //: tabview
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
            
        } //: groupbox
    }
}

struct InsetFactView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetFactView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
