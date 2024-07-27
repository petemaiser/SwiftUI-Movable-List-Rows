//
//  movable_listrowsApp.swift
//  movable-listrows
//
//  Created by Pete Maiser on 7/21/24.
//

import SwiftUI

@main
struct movable_listrowsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
