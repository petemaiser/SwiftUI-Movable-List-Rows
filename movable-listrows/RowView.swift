//
//  RowView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/22/24.
//

import SwiftUI

struct RowView: View {
    let columnWidths: (Int, Int)
    let spacerWidth: Int
    let strings: (String, String)

    var isBold: Bool
    
    init(columnWidths: (Int, Int), sideSpacerWidth: Int, strings: (String, String), isBold: Bool = false) {
        self.columnWidths = columnWidths
        self.spacerWidth = sideSpacerWidth
        self.strings = strings
        self.isBold = isBold
    }
    
    var body: some View {
        HStack {
            Spacer()
                .frame(minWidth:CGFloat(integerLiteral:spacerWidth))
            Text(strings.0)
                .font(.body)
                .frame(width: CGFloat(integerLiteral: columnWidths.0))
                .bold(isBold)
            Spacer()
            Text(strings.1)
                .font(.body)
                .frame(width: CGFloat(integerLiteral: columnWidths.1))
                .bold(isBold)
            Spacer()
                .frame(minWidth:CGFloat(integerLiteral:spacerWidth))
        }
    }
}

#Preview {
    VStack {
        RowView(columnWidths: ViewModel().settings.columnWidths, sideSpacerWidth: ViewModel().settings.sideSpacerWidth, strings: ("Number","Name"), isBold: true)
        RowView(columnWidths: ViewModel().settings.columnWidths, sideSpacerWidth: ViewModel().settings.sideSpacerWidth, strings: ("\(Item().id)",Item().name))
    }
}
