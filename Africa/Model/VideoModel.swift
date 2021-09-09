//
//  VideoModel.swift
//  Africa
//
//  Created by Fahim Rahman on 8/21/21.
//

import SwiftUI

// video model
struct Video: Codable, Identifiable {
    
    let id: String
    let name: String
    let headline: String
    
    // computed property
    var thumbnail: String {
        "video-\(self.id)"
    }
}
