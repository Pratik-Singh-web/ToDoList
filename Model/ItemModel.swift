//
//  itemModel.swift
//  ToDoList
//
//  Created by Pratik Kumar Singh on 4/25/24.
//

import Foundation

struct ItemModel : Identifiable, Codable {
    let id : String
    let title : String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateModel() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
