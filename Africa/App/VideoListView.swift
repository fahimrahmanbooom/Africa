//
//  VideoListView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/19/21.
//

import SwiftUI

struct VideoListView: View {
    
    // properties
    @ State var videos: [Video] = Bundle.main.decode("videos.json")
    
    let hapticImpact = UIImpactFeedbackGenerator(style: .medium)
    
    // body
    var body: some View {
        
        // navigation
        NavigationView {
            
            // list
            List {
                
                // foreach
                ForEach(videos) { item in
                    
                    // navigation link
                    NavigationLink(
                        
                        destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name),
                        
                        label: {
                            
                            VideoListItemView(video: item)
                                .padding(.vertical, 8)
                            
                        }) //: navigation link
                } //: foreach
            } //: list
            .navigationBarTitle("Videos", displayMode: .inline)
            .toolbar(content: {
                
                // toolbar Item
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    // button
                    Button(action: {
                        
                        // shuffle videos on the list
                        videos.shuffle()
                        
                        // trigger the haptic
                        hapticImpact.impactOccurred()
                        
                    }, label: {
                        
                        Image(systemName: "arrow.2.squarepath")
                        
                    }) //: button
                } //: toolbar Item
            })
        } //: navigation
    }
}


struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
