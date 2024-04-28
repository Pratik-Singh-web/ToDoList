//
//  ListRowView.swift
//  ToDoList
//
//  Created by Pratik Kumar Singh on 4/25/24.
//

import SwiftUI

struct ListRowView: View {
    
    @State var item : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
    }
}

#Preview {
    Group{
        ListRowView(item: ItemModel(title: "Preview 1", isCompleted: true))
        ListRowView(item: ItemModel(title: "Preview 2", isCompleted: false))
    }
    .previewLayout(.sizeThatFits)
}
