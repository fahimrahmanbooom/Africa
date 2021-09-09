//
//  VideoListItem.swift
//  Africa
//
//  Created by Fahim Rahman on 8/21/21.
//

import SwiftUI

struct VideoListItemView: View {
    
    // properties
    let video: Video
    
    // body
    var body: some View {
        
        // hstack
        HStack(spacing: 10) {
            
            // zstack
            ZStack {
                
                Image(video.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 80)
                    .cornerRadius(9)
                
                Image(systemName: "play.circle")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect()
                    .frame(height: 32)
                    .shadow(radius: 4)
                
            } //: zstack
            
            // vstack
            VStack(alignment: .leading, spacing: 10, content: {
                
                Text(video.name)
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.accentColor)
                
                Text(video.headline)
                    .font(.footnote)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                
            }) //: vstack
        } //: hstack
    }
}


struct VideoListItem_Previews: PreviewProvider {
    
    static private let videos: [Video] = Bundle.main.decode("videos.json")
    
    static var previews: some View {
        VideoListItemView(video: videos.first!)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
