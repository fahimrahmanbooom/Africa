//
//  AnimalGridItemView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/30/21.
//

import SwiftUI

struct AnimalGridItemView: View {
    
    // properties
    let animal: Animal
    
    // body
    var body: some View {
        Image(animal.image)
            .resizable()
            .scaledToFit()
            .cornerRadius(12)
    }
}


struct AnimalGridItemView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalGridItemView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
