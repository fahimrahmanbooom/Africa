//
//  CenterModifier.swift
//  Africa
//
//  Created by Fahim Rahman on 9/3/21.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack(content: {
            Spacer()
            content
            Spacer()
        })
    }
}
