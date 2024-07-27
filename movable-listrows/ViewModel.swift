//
//  ViewModel.swift
//  movable-listrows
//
//  Created by Pete Maiser on 7/21/24.
//

import Foundation

struct Item : Identifiable {
    private(set) var id: Int = 0
    private(set) var name: String = "Init Item"
}

class ViewModel: ObservableObject
{
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
        nextId += 1
        items.append(Item(id:nextId, name: "Item #\(nextId)"))
    }
}
