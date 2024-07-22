//
//  TablesView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/21/24.
//

import SwiftUI

struct TableViewNormal: View {
    
    @State private var itemStore = ItemStore.getSharedStore
    @State private var isEditing = false
    
    var body: some View {       
        Table(itemStore.list) {
            TableColumn("Id") {item in
                Text(String(item.id))}
            TableColumn("Name", value: \.name)
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
    TableViewNormal()
}
