//
//  ListView.swift
//  ToDoList
//
//  Created by Pratik Kumar Singh on 4/25/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List{
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .navigationTitle("ToDo List 📝")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: AddView()))
    }
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}
