//
//  RowView.swift
//  movable-listrows
//
//  Created by Pete Maiser on 7/22/24.
//

import SwiftUI

struct RowView: View {
    let columnWidths: (Int, Int)
    let sideSpacerWidth: Int
    let strings: (String, String)
    var isBold: Bool
    
    init(columnWidths: (Int, Int), sideSpacerWidth: Int, strings: (String, String), isBold: Bool = false) {
        self.columnWidths = columnWidths
        self.sideSpacerWidth = sideSpacerWidth
        self.strings = strings
        self.isBold = isBold
    }
    
    var body: some View {
        HStack {
            Spacer()
                .frame(minWidth:CGFloat(integerLiteral:sideSpacerWidth))
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
                .frame(minWidth:CGFloat(integerLiteral:sideSpacerWidth))
        }
    }
}

#Preview {
    VStack {
        RowView(columnWidths: ContentView(viewModel: ViewModel()).columnWidths, sideSpacerWidth: ContentView(viewModel: ViewModel()).sideSpacerWidth, strings: ("Position","Name"), isBold: true)
        RowView(columnWidths: ContentView(viewModel: ViewModel()).columnWidths, sideSpacerWidth: ContentView(viewModel: ViewModel()).sideSpacerWidth, strings: ("1",Item().name))
    }
}
