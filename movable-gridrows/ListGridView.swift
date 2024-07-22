//
//  ListGridView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/22/24.
//

import SwiftUI

struct ListGridView: View {
    @State private var itemStore = ItemStore.getSharedStore
    @State private var isEditing = false
    
    var body: some View {
        List
        {
            Grid
            {
                GridRow {
                    Text("Id")
                    Text("Item Name")
                }
                .bold()
                Divider()
                ForEach(itemStore.list.indices, id: \.self) { i in
                    GridRow {
                       Text("\(itemStore.list[i].id)")
                        Text(itemStore.list[i].name)

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
}

#Preview {
    ListGridView()
}
