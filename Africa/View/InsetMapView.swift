//
//  InsetMapView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/20/21.
//

import SwiftUI
import MapKit

struct InsetMapView: View {
    
    // properties
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599), span: MKCoordinateSpan(latitudeDelta: 60.0, longitudeDelta: 60.0))
    
    // body
    var body: some View {
        
        // map
        Map(coordinateRegion: $region)
            .overlay(
                // navigation
                NavigationLink(destination: MapView(), label: {
                    
                    // hstack
                    HStack {
                        
                        Image(systemName: "mappin.circle")
                            .foregroundColor(.white)
                            .imageScale(.large)
                        
                        Text("Locations")
                            .foregroundColor(.accentColor)
                            .fontWeight(.bold)
                        
                    } //: hstack
                    .padding(.vertical, 10)
                    .padding(.horizontal, 14)
                    .background(Color.black)
                    .opacity(0.4)
                    .cornerRadius(8)
                    
                }) //: navigation
                .padding(12), alignment: .topTrailing
            )
            .frame(height: 256)
            .cornerRadius(12)
    }
}


struct InsetMapView_Previews: PreviewProvider {
    static var previews: some View {
        InsetMapView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
