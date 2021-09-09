//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/20/21.
//

import SwiftUI

struct AnimalListItemView: View {
    
    // properties
    let animal: Animal
    
    // body
    var body: some View {
        
        // hstack
        HStack(alignment: .center, spacing: 16, content: {
            
            Image(animal.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            // vstack
            VStack(alignment: .leading, spacing: 8, content: {
                
                Text(animal.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(animal.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding(.trailing, 8)
            }) //: vstack
        }) //: hstack
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        AnimalListItemView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
