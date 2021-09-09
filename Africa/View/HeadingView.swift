//
//  HeadingView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/20/21.
//

import SwiftUI

struct HeadingView: View {
    
    // properties
    var headingImage: String
    var headingText: String
    
    // body
    var body: some View {
        
        // hstack
        HStack {
            
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)
            
        } //: hstack
        .padding(.vertical)
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
