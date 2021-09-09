//
//  LocationModel.swift
//  Africa
//
//  Created by Fahim Rahman on 8/28/21.
//

import SwiftUI
import MapKit

// location model

struct NationalParkLocation: Codable, Identifiable {
    
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    // computed property
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
