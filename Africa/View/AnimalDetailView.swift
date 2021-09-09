//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/20/21.
//

import SwiftUI

struct AnimalDetailView: View {
    
    // properties
    let animal: Animal
    
    // body
    var body: some View {
        
        // scrollview
        ScrollView(.vertical, showsIndicators: false, content: {
            
            //vstack
            VStack(alignment: .center, spacing: 20, content: {
                
                // hero image
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // title
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(Color.accentColor.frame(height: 6).offset(y: 24))
                
                // headline
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // gallery
                // group
                Group {
                    
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Picture")
                    
                    InsetGalleryView(animal: animal)
                    
                } //: group
                .padding(.horizontal)
                
                // facts
                // group
                Group {
                    
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did you know?")
                    
                    InsetFactView(animal: animal)
                } //: group
                .padding(.horizontal)
                
                // description
                // group
                Group {
                    
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                    
                } //: group
                .padding(.horizontal)
                
                // map
                // group
                Group {
                    
                    HeadingView(headingImage: "map", headingText: "National Parks")
                    
                    InsetMapView()
                    
                } //: group
                .padding(.horizontal)
                
                // link
                // group
                Group {
                    
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    
                    ExternalWebLinkView(animal: animal)
                    
                } //: group
                .padding(.horizontal)
                
            }) //: vstack
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        }) //: scrollview
    }
}


struct AnimalDetailView_Previews: PreviewProvider {
    
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    
    static var previews: some View {
        NavigationView {
            AnimalDetailView(animal: animals.first!)
        }
    }
}
