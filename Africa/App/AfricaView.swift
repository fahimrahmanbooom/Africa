//
//  AfricaView.swift
//  Africa
//
//  Created by Fahim Rahman on 8/18/21.
//

import SwiftUI

struct AfricaView: View {
    
    // properties
    @State private var isGridViewActive: Bool = false
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolBarIcon: String = "square.grid.2x2"
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    // body
    var body: some View {
        
        // navigationView
        NavigationView {
            // group
            Group {
                // if
                if !isGridViewActive {
                    // list
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 20, trailing: 0))
                        
                        // foreach
                        ForEach(animals) { animal in
                            
                            // navigation link
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal),
                                label: {
                                    AnimalListItemView(animal: animal)
                                        .padding(.vertical, 5)
                                }) //: navigation link
                        } //: foreach
                        CreditsView()
                            .modifier(CenterModifier())
                    } //: List
                } else {
                    // scroll view
                    ScrollView(.vertical, showsIndicators: false, content: {
                        // lazy v grid
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10, content: {
                            // foreach
                            ForEach(animals) { animal in
                                // navigation link
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal),
                                    label: {
                                        AnimalGridItemView(animal: animal)
                                    }) //: navigation link
                            } //: foreach
                        }) //: lazy v grid
                        .animation(.easeIn)
                        .padding(10)
                    }) //: scroll view
                } //: else
            } //: group
            
            .navigationBarTitle("Africa", displayMode: .large)
            .listStyle(PlainListStyle())
            
            // toolbar
            .toolbar {
                // toolbar item
                ToolbarItem(placement: .navigationBarTrailing) {
                    // hstack
                    HStack(alignment: .center, spacing: 16, content: {
                        // list button
                        Button(action: {
                            print("List View is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        }) //: list button
                        
                        // grid button
                        Button(action: {
                            print("Grid View is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: toolBarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }) //: grid button
                    }) //: hstack
                } //: toolbar item
            } //: toolbar
        } //: NavigationView
    }
    
    
    // MARK: - functions
    
    func gridSwitch() {
        
        // change grid column
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid number: \(gridColumn)")
        
        // change grid icon
        switch gridColumn {
        case 1:
            toolBarIcon = "square.grid.2x2"
        case 2:
            toolBarIcon = "square.grid.3x2"
        case 3:
            toolBarIcon = "rectangle.grid.1x2"
        default:
            toolBarIcon = "square.grid.2x2"
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AfricaView()
    }
}
