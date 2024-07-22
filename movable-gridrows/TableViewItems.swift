//
//  TableViewCompactView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/22/24.
//

import SwiftUI

struct TableViewItems: View {
    
    @State private var itemStore = ItemStore.getSharedStore
    @State private var isEditing = false
    
    let w1 = 200
    let w2 = 200
    let sw = 50
    
    var body: some View {
        Table(itemStore.list) {
            TableColumn("Items") {item in
                    ItemView(columWidths: (w1,w2), spacerWidth: sw, item: item)
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(isEditing ? "Done" : "Edit") {
                    withAnimation { isEditing.toggle() }
                }
            }
        }
    }
}

#Preview {
    TableViewItems()
}
