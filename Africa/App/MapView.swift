//
//  MapView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/19/21.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    // properties
    // closure
    @State private var region: MKCoordinateRegion = {
        
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    // body
    var body: some View {
        
        // map with annotations
        Map(coordinateRegion: $region, annotationItems: locations) { item in

            // complex map annotation
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            } //: annotation
        } //: map
        .overlay(
            // hstack
            HStack(alignment: .center, spacing: 12, content: {
                
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                
                // vstack
                VStack(alignment: .leading, spacing: 3, content: {
                    
                    // hstack
                    HStack {
                        
                        // latitude hstack
                        Text("Latitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                    } //: hstack
                    
                    Divider()
                    
                    // longitude hstack
                    HStack {
                        
                        Text("Longitude")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                    } //: hstack
                }) //: vstack
            }) //: hstack
        
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.black)
            .cornerRadius(8)
            .opacity(0.6)
            .padding()
            
            ,alignment: .top
        )
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
