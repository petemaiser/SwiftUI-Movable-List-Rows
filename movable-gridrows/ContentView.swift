//
//  ContentView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/21/24.
//

import SwiftUI

struct ContentView: View {
      
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: VStackView(), label: {Text("VStack of custom Item Views")})
                    .padding()
                NavigationLink(destination: ListView(), label: {Text("List of custom Item Views")})
                    .padding()
                NavigationLink(destination: GridView(), label: {Text("Grid of custom Item Views")})
                    .padding()
                NavigationLink(destination: ListGridView(), label: {Text("List - Grid - GridRows")})
                    .padding()
                NavigationLink(destination: TableViewNormal(), label: {Text("Table")})
                    .padding()
                NavigationLink(destination: TableViewCompact(), label: {Text("Table as 1 column (compact)")})
                    .padding()
                NavigationLink(destination: TableViewItems(), label: {Text("Table of Item Views")})
                    .padding()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
