//
//  ItemView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/22/24.
//

import SwiftUI

struct ItemView: View {
    let columnWidths: (Int, Int)
    let spacerWidth: (Int)
    let item: Item
    
    var body: some View {
        RowView(columnWidths: columnWidths, sideSpacerWidth: spacerWidth, strings: ("\(item.id)", item.name))
    }
}

#Preview {
    ItemView(columnWidths: ViewModel().settings.columnWidths, spacerWidth: ViewModel().settings.sideSpacerWidth, item: Item())
}
