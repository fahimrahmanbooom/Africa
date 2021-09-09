//
//  AnimalModel.swift
//  Africa
//
//  Created by Fahim Rahman on 8/20/21.
//

import SwiftUI

// animal model
struct Animal: Codable, Identifiable {
    
    let id: String
    let name: String
    let headline: String
    let description: String
    let link: String
    let image: String
    let gallery: [String]
    let fact: [String]
}
