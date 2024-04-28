//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Pratik Kumar Singh on 4/25/24.
//

import SwiftUI


/*
 MARK: MVVM
 
 M - Model (Data Point)
 V - View (UI)
 VM - ViewModel (Data logic to show UI.)
 
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
