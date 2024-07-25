//
//  ViewModel.swift
//  movable-gridrows
//
//  Created by Pete Maiser on 7/21/24.
//

import Foundation

struct Settings {
    let columWidths = (125,200)
    let spacerWidth = 50
}

struct Item : Identifiable {
    private(set) var id: Int = 0
    private(set) var name: String = "Init Item"
}

class ViewModel: ObservableObject
{
    var settings = Settings()
    private(set) var nextId = 0
      
    @Published var items : [Item]
    
    init() {
        self.items = [
            (Item(id:0, name: "First")),
            (Item(id:1, name: "Second")),
            (Item(id:2, name: "Third")),
            (Item(id:3, name: "Fourth")),
            (Item(id:4, name: "Fifth"))]
        self.nextId = self.items.count
    }
        
    func addItem() {
        items.append(Item(id:nextId, name: "Another"))
        nextId += 1
    }
}
