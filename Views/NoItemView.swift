//
//  NoItemView.swift
//  ToDoList
//
//  Created by Pratik Kumar Singh on 4/28/24.
//

import SwiftUI

struct NoItemView: View {
    
//    @EnvironmentObject var listViewModel: ListViewModel
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView{
            VStack(spacing: 10){
                Text("There are no Items!")
                    .font(.largeTitle)
                Text("Hey! You are a productive person. Please add some productive work item in your work list.")
                    .font(.headline)
                    .padding(.bottom, 10)
                NavigationLink(destination: AddView()) {
                    Text("Add Something 🙂")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(animate ? Color.red : Color.mint)
                    .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30.0 : 50.0)
                .shadow(
                    color: animate ? Color.red.opacity(0.7) : Color.mint.opacity(0.7),
                    radius: animate ? 30.0 : 10.0,
                    x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/,
                    y: animate ? 50.0 : 30.0
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    func addAnimation(){
        guard !animate else {return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            withAnimation(
                Animation
                    .easeOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NoItemView()
}
