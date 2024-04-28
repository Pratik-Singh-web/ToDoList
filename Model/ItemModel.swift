//
//  itemModel.swift
//  ToDoList
//
//  Created by Pratik Kumar Singh on 4/25/24.
//

import Foundation

struct ItemModel : Identifiable {
    var id : String = UUID().uuidString
    var title : String
    var isCompleted : Bool
}
