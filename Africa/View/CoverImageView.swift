//
//  CoverImageView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/19/21.
//

import SwiftUI

struct CoverImageView: View {
    
    // properties
    let coverImages: [CoverImage] = Bundle.main.decode("covers.json")
    
    // body
    var body: some View {
        
        // tabview
        TabView {
            
            ForEach(coverImages) { item in
                
                Image(item.name)
                    .resizable()
                    .scaledToFill()
                
            } //: ForEach
        } //: TabView
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CoverImageView()
            .previewLayout(.fixed(width: 400, height: 300))
    }
}
