//
//  MainView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/19/21.
//

import SwiftUI

struct MainView: View {
    
    // properties
    
    // body
    var body: some View {
        
        // tabview
        TabView {
            
            // africa view
            AfricaView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }
            
            // video list view
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }
            
            // map view
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Locations")
                }
            
            // gallery view
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("gallery")
                }
            
        } //: TabView
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
