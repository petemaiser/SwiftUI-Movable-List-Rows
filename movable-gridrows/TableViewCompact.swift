//
//  TableViewCompact.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/22/24.
//

import SwiftUI

struct TableViewCompact: View {
    
    @State private var itemStore = ItemStore.getSharedStore
    @State private var isEditing = false
    
    var body: some View {
        Table(itemStore.list) {
            TableColumn("Items") {item in
                HStack {
                    Text(String(item.id))
                    Spacer()
                    Text(item.name)
                    Spacer()
                }
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
    TableViewCompact()
}
