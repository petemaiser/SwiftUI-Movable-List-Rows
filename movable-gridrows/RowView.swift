//
//  HeaderView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/22/24.
//

import SwiftUI

struct RowView: View {
    let columWidths: (Int, Int)
    let spacerWidth: Int
    let strings: (String, String)

    var isBold: Bool
    
    init(columWidths: (Int, Int), spacerWidth: Int, strings: (String, String), isBold: Bool = false) {
        self.columWidths = columWidths
        self.spacerWidth = spacerWidth
        self.strings = strings
        self.isBold = isBold
    }
    
    var body: some View {
        HStack {
            Spacer()
                .frame(width:CGFloat(integerLiteral:spacerWidth))
            Text(strings.0)
                .font(.body)
                .frame(minWidth: CGFloat(integerLiteral: columWidths.0), maxWidth: CGFloat(integerLiteral: columWidths.0))
                .bold(isBold)
            Text(strings.1)
                .font(.body)
                .frame(minWidth: CGFloat(integerLiteral: columWidths.1), maxWidth: CGFloat(integerLiteral: columWidths.1))
                .bold(isBold)
            Spacer()
                .frame(width:CGFloat(integerLiteral:spacerWidth))
        }
    }
}

#Preview {
    RowView(columWidths: (200,200), spacerWidth: 50, strings: ("Number","Name"))
}
