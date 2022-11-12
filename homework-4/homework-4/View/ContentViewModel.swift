//
//  ContentViewModel.swift
//  homework-4
//
//  Created by Владимир Тамбовцев on 13.11.2022.
//

import SwiftUI

struct ContentViewModel: ViewModifier {
    @EnvironmentObject
    var store: Store
    
    func body(content: Content) -> some View {
        content.navigationTitle("Todos")
            .navigationBarItems(trailing: HStack(spacing: 30) {
                EditButton()
                    .disabled(store.state.todos.isEmpty)
                Button(action: {store.isPresented.toggle()}, label: {
                    Image(systemName: "plus").imageScale(.large)
                })
            }.onChange(of: store.sorted) { sort in
                guard store.state.todos.isEmpty else {return}
                withAnimation() {store.dispatch(action: .sort(sort))}
            }
                .fullScreenCover(isPresented: $store.isPresented) {
                    AddTodoView()
                }
            )
    }
}
