//
//  GridView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/21/24.
//

import SwiftUI

struct GridView: View {
    
    @State private var itemStore = ItemStore.getSharedStore
    @State private var isEditing = false
    
    let w1 = 200
    let w2 = 200
    
    var body: some View {
        Grid
        {
            GridRow {
                RowView(columWidths: (w1,w2), strings: ("Number", "Name"), isBold: true)
            }
            .bold()
            Divider()
            ForEach(itemStore.list.indices, id: \.self) { i in
                GridRow {
                    ItemView(columWidths: (w1,w2), item: itemStore.list[i])
                }
            }
            Spacer()
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
    GridView()
}
