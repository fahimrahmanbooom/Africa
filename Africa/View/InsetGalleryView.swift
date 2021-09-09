//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/20/21.
//

import SwiftUI

struct InsetGalleryView: View {
    
    // properties
    let animal: Animal
    
    // body
    var body: some View {
        
        // scrollview
        ScrollView(.horizontal, showsIndicators: false, content: {
            
            // hstack
            HStack(alignment: .center, spacing: 15, content: {
                
                // foreach
                ForEach(animal.gallery, id: \.self) { item in
                    
                    // image
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                } //: foreach
            }) //: hstack
        }) //: scrollview
    }
}


struct InsetGalleryView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        InsetGalleryView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
