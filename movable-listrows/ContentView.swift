//
//  ContentView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel
    @Environment(\.editMode) private var editMode
    
    var body: some View {
        List
        {
            // Header
            RowView(columnWidths: viewModel.settings.columnWidths, sideSpacerWidth: viewModel.settings.sideSpacerWidth, strings: ("Number", "Name"), isBold: true)
            
            // Items
            ForEach(viewModel.items.indices, id: \.self) { i in
                ItemView(columnWidths: viewModel.settings.columnWidths, spacerWidth: viewModel.settings.sideSpacerWidth, item: viewModel.items[i])
            }
            .onDelete(perform: delete)
            .onMove(perform: move)
            .onChange(of: editMode!.wrappedValue) {
                if editMode?.wrappedValue.isEditing == true {
                    print("Entering Editing Mode")
                } else {
                    print("Leaving Editing Mode")
                }
            }
            
            // Edit Button
            HStack {
                Spacer()
                if editMode?.wrappedValue.isEditing == true
                {
                    // Add button - when Editing only
                    Button(action: add) {
                        Image(systemName: "plus")
                    }
                    .frame(minWidth: CGFloat(integerLiteral: viewModel.settings.columnWidths.0), maxWidth: CGFloat(integerLiteral: viewModel.settings.columnWidths.0))
                    .buttonStyle(BorderlessButtonStyle())
                }
                EditButton()
                    .frame(minWidth: CGFloat(integerLiteral: viewModel.settings.columnWidths.1), maxWidth: CGFloat(integerLiteral: viewModel.settings.columnWidths.1))
                    .buttonStyle(BorderlessButtonStyle())
                Spacer()
            }
        }
    }
    
    private func add() {
        print("Adding item")
        viewModel.addItem()
    }
    
    private func delete(offsets: IndexSet) {
        print("Deleting item")
        viewModel.items.remove(atOffsets: offsets)
    }

    private func move(offsets: IndexSet, destination: Int) {
        print("Moving item")
        viewModel.items.move(fromOffsets: offsets, toOffset: destination)
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
