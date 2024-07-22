//
//  ListView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/22/24.
//

import SwiftUI

struct ListView: View {
    
    @State private var itemStore = ItemStore.getSharedStore
    @State private var editMode = EditMode.inactive

    let columWidths = (125,200)
    let spacerWidth = 50
    
    var body: some View {
        List
        {
            RowView(columWidths: columWidths, spacerWidth: spacerWidth, strings: ("Number", "Name"), isBold: true)
            ForEach(itemStore.list.indices, id: \.self) { i in
                ItemView(columWidths: columWidths, spacerWidth: spacerWidth, item: itemStore.list[i])
            }
            .onDelete(perform: delete)
            .onMove(perform: move)
            HStack {
                Spacer()
                    .frame(width:CGFloat(integerLiteral:spacerWidth))
                Button(action: add) {
                    Image(systemName: "plus")
                }
                    .frame(minWidth: CGFloat(integerLiteral: columWidths.0), maxWidth: CGFloat(integerLiteral: columWidths.0))
                    .buttonStyle(BorderlessButtonStyle())
                EditButton()
                    .frame(minWidth: CGFloat(integerLiteral: columWidths.1), maxWidth: CGFloat(integerLiteral: columWidths.1))
                    .buttonStyle(BorderlessButtonStyle())
                Spacer()
                    .frame(width:CGFloat(integerLiteral:spacerWidth))
            }
        }
    }
    
    private func add() {
        print("add requested")
    }
    
    private func delete(offsets: IndexSet) {
        print("delete requested")
    }

    private func move(source: IndexSet, destination: Int) {
        print("move requested")
    }
}

#Preview {
    ListView()
}
