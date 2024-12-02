//
//  ContentView.swift
//  movable-listrows
//
//  Created by Pete Maiser on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel: ViewModel
    @Environment(\.editMode) private var editMode
    
    let columnWidths = (125,200)
    let sideSpacerWidth = 50
    
    var body: some View {
        VStack {
            Text("List Rows that can be Edited!").font(.headline)
            List {
                // Header
                RowView(columnWidths: columnWidths, sideSpacerWidth: sideSpacerWidth, strings: ("Position", "Name"), isBold: true)
                    .alignmentGuide(.listRowSeparatorLeading) {_ in -20}
                
                // Items
                ForEach(0..<viewModel.items.count, id: \.self) { i in
                    // use text variables (immutable)
                    let position = "\(i+1)"
                    let name = viewModel.items[i].name
                    // because separate variables makes it easy to experiment with things like:
                    // let position = viewModel.items.firstIndex{$0 == viewModel.items[i]} ?? 0     // make item Equatable

                    RowView(columnWidths: columnWidths, sideSpacerWidth: sideSpacerWidth, strings: (position, name))
                        .alignmentGuide(.listRowSeparatorLeading) {_ in -20}
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
                .onChange(of: editMode!.wrappedValue) {
                    if editMode?.wrappedValue.isEditing == true {
                        print("starting Editing Mode")
                    } else {
                        print("ending Editing Mode")
                    }
                }
                
                // Edit Button
                HStack {
                    Spacer()
                    if editMode?.wrappedValue.isEditing == true
                    {
                        // 'Add' button - when in Editing Mode only
                        Button(action: add) {
                            Image(systemName: "plus")
                        }
                        .frame(minWidth: CGFloat(integerLiteral: columnWidths.0), maxWidth: CGFloat(integerLiteral: columnWidths.0))
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    EditButton()
                        .frame(minWidth: CGFloat(integerLiteral: columnWidths.1), maxWidth: CGFloat(integerLiteral: columnWidths.1))
                        .buttonStyle(BorderlessButtonStyle())
                    Spacer()
                }
            }
            .listStyle(DefaultListStyle())
        }
    }
    
    private func add() {
        print("adding item")
        viewModel.addItem()
    }
    
    private func delete(offsets: IndexSet) {
        print("deleting item")
        viewModel.items.remove(atOffsets: offsets)
    }

    private func move(offsets: IndexSet, destination: Int) {
        print("moving item")
        viewModel.items.move(fromOffsets: offsets, toOffset: destination)
    }
}

#Preview {
    ContentView(viewModel: ViewModel())
}
