//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/21/21.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    
    // properties
    var videoSelected: String
    var videoTitle: String
    
    // body
    var body: some View {
        
        // vstack
        VStack {
            
            // video player
            VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4"))
                .overlay(
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 32, height: 32), alignment: .topLeading
                )
                .padding(.top, 6)
                .padding(.horizontal, 8)
        } //: vstack
        .accentColor(.accentColor)
        .navigationBarTitle(videoTitle, displayMode: .inline)
    }
}


struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            VideoPlayerView(videoSelected: "lion", videoTitle: "Lion")
        }
    }
}
