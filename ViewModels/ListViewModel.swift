//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Pratik Kumar Singh on 4/25/24.
//

import Foundation

class ListViewModel : ObservableObject{
    
    @Published var items : [ItemModel] = []
    
    init() {
        getItmes()
    }
    
    func deleteItem(indexSet : IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func getItmes() {
        let newItems = [
            ItemModel(title: "First Item", isCompleted: true),
            ItemModel(title: "Second Item", isCompleted: false),
            ItemModel(title: "third Item", isCompleted: true),
            ItemModel(title: "last Item", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    
    func addItem(title : String){
        items.append(ItemModel(title: title, isCompleted: false))
    }
}
