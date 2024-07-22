//
//  VStack.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/22/24.
//

import SwiftUI

struct VStackView: View {
    
    @State private var itemStore = ItemStore.getSharedStore
    @State private var isEditing = false

    let w1 = 200
    let w2 = 200
    
    var body: some View {
        VStack
        {
            RowView(columWidths: (w1,w2), strings: ("Number", "Name"), isBold: true)
            ForEach(itemStore.list.indices, id: \.self) { i in
                ItemView(columWidths: (w1,w2), item: itemStore.list[i])
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
    VStackView()
}
