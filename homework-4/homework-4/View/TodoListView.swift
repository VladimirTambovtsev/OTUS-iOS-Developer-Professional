//
//  TodoListView.swift
//  homework-4
//
//  Created by Владимир Тамбовцев on 13.11.2022.
//

import SwiftUI

struct TodoListView: View {
    @EnvironmentObject
    var store: Store

    var body: some View {
        List {
            ForEach(store.state.todos) { todo in
                TodoView(todo: todo)
            }.onDelete {
                store.dispatch(action: .removeTodo($0))
            }
        }.listStyle(InsetListStyle())
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
