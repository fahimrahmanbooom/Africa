//
//  CreditsView.swift
//  Africa
//
//  Created by Fahim Rahman on 9/3/21.
//

import SwiftUI

struct CreditsView: View {
    
    // properties
    
    // body
    var body: some View {
        // vstack
        VStack {
            
            Image("compass")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128, alignment: .center)
                .padding()
            
            Text("""
            Copyright © Fahim Rahman
            All right reserved
            Better App ♥︎ Less Code
            """)
            .font(.footnote)
            .multilineTextAlignment(.center)
        } //: vstack
        .padding()
        .opacity(0.4)
    }
}


struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
