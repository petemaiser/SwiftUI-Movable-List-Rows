//
//  ItemStore.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/21/24.
//

import Foundation

struct Item : Identifiable {
    private(set) var id: Int = 0
    private(set) var name: String = "Test Item"
}

final class ItemStore {
    
    // keep it easy by initiating/getting this store as a Swift Singleton
    static let  getSharedStore = ItemStore()
    
    // the stuff in the store
    var list : [Item]
    
    // the initiatizer
    private init() {
        self.list = [
            (Item(id:0, name: "First")),
            (Item(id:1, name: "Second")),
            (Item(id:2, name: "Third")),
            (Item(id:3, name: "Fourth")),
            (Item(id:4, name: "Fifth"))
        ]
    }
}
