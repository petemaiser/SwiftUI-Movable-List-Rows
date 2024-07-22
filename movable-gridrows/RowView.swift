//
//  HeaderView.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/22/24.
//

import SwiftUI

struct RowView: View {
    let columWidths: (Int, Int)
    let strings: (String, String)

    var isBold: Bool
    
    init(columWidths: (Int, Int), strings: (String, String), isBold: Bool = false) {
        self.columWidths = columWidths
        self.strings = strings
        self.isBold = isBold
    }
    
    var body: some View {
        HStack {
            Text(strings.0)
                .font(.body)
                .frame(minWidth: CGFloat(integerLiteral: columWidths.0), maxWidth: CGFloat(integerLiteral: columWidths.0))
                .bold(isBold)
            Text(strings.1)
                .font(.body)
                .frame(minWidth: CGFloat(integerLiteral: columWidths.1), maxWidth: CGFloat(integerLiteral: columWidths.1))
                .bold(isBold)
        }
    }
}

#Preview {
    RowView(columWidths: (200,200), strings: ("Number","Name"))
}
