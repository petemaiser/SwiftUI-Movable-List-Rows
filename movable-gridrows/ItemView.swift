//
//  ItemView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/22/24.
//

import SwiftUI

struct ItemView: View {
    let columWidths: (Int, Int)
    let spacerWidth: (Int)
    let item: Item
    
    var body: some View {
        RowView(columWidths: columWidths, spacerWidth: spacerWidth, strings: ("\(item.id)", item.name))
    }
}

#Preview {
    ItemView(columWidths: ViewModel().settings.columWidths, spacerWidth: ViewModel().settings.spacerWidth, item: Item())
}
