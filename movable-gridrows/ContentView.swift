//
//  ContentView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        List
        {
            // Header
            RowView(columWidths: viewModel.settings.columWidths, spacerWidth: viewModel.settings.spacerWidth, strings: ("Number", "Name"), isBold: true)
            
            // Items
            ForEach(viewModel.items.indices, id: \.self) { i in
                ItemView(columWidths: viewModel.settings.columWidths, spacerWidth: viewModel.settings.spacerWidth, item: viewModel.items[i])
            }
            .onDelete(perform: delete)
            .onMove(perform: move)
            
            // Edit Buttons
            HStack {
                Spacer()
                    .frame(width:CGFloat(integerLiteral:viewModel.settings.spacerWidth))
                Button(action: add) {
                    Image(systemName: "plus")
                }
                .frame(minWidth: CGFloat(integerLiteral: viewModel.settings.columWidths.0), maxWidth: CGFloat(integerLiteral: viewModel.settings.columWidths.0))
                    .buttonStyle(BorderlessButtonStyle())
                EditButton()
                    .frame(minWidth: CGFloat(integerLiteral: viewModel.settings.columWidths.1), maxWidth: CGFloat(integerLiteral: viewModel.settings.columWidths.1))
                    .buttonStyle(BorderlessButtonStyle())
                Spacer()
                    .frame(width:CGFloat(integerLiteral:viewModel.settings.spacerWidth))
            }
        }
    }
    
    private func add() {
        viewModel.addItem()
    }
    
    private func delete(offsets: IndexSet) {
        viewModel.items.remove(atOffsets: offsets)
    }

    private func move(offsets: IndexSet, destination: Int) {
        viewModel.items.move(fromOffsets: offsets, toOffset: destination)
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
