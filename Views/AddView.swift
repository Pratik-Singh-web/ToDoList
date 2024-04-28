//
//  AddView.swift
//  ToDoList
//
//  Created by Pratik Kumar Singh on 4/25/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText : String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type Something Here...", text: $textFieldText)
                    .padding()
                    .frame(height: 50)
                    .background(Color(cgColor: UIColor.secondarySystemBackground.cgColor))
                    .cornerRadius(10.0)
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundStyle(Color.white)
                        .font(.headline)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10.0)
                })
            }
            .padding()
        }
        .navigationTitle("Add an Item 🖊️")
    }
    
    func saveButtonPressed(){
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
