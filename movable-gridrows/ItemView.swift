//
//  RowView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/22/24.
//

import SwiftUI

struct ItemView: View {
    let columWidths: (Int, Int)
    let item: Item
    
    var body: some View {
        RowView(columWidths: columWidths, strings: ("\(item.id)", item.name))
    }
}

#Preview {
    ItemView(columWidths: (200,200), item: Item())
}
