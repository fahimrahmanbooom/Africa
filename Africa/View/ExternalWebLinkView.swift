//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/21/21.
//

import SwiftUI

struct ExternalWebLinkView: View {
    
    // properties
    let animal: Animal
    
    // body
    var body: some View {
        
        // group box
        GroupBox {
            
            // hstack
            HStack {
                
                Image(systemName: "globe")
                
                Text("Wikipedia")
                
                Spacer()
                
                // group
                Group {
    
                    Link(destination: URL(string: animal.link) ?? URL(string: "https://wikipedia.org")!, label: {
                        Text(animal.name)
                    })
                    
                    Image(systemName: "arrow.up.right.square")
                    
                } //: group
                .foregroundColor(.accentColor)
            } //: hstack
        } //: group box
    }
}


struct ExternalWebLinkView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        ExternalWebLinkView(animal: animals.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
