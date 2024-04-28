//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Pratik Kumar Singh on 4/25/24.
//

import Foundation

class ListViewModel : ObservableObject{
    
    @Published var items : [ItemModel] = []{
        didSet{
            saveItem()
        }
    }
    let itemList: String = "items_list"
    
    init() {
        getItmes()
    }
    
    func getItmes() {
        guard 
            let data = UserDefaults.standard.data(forKey: itemList),
            let encodedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        self.items = encodedItems
    }
    
    func deleteItem(indexSet : IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title : String){
        items.append(ItemModel(title: title, isCompleted: false))
    }
    
    func updateItem(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateModel()
        }
    }
    
    func saveItem(){
        if let encodedItems = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedItems, forKey: itemList)
        }
    }
}
