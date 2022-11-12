//
//  TodoView.swift
//  homework-4
//
//  Created by Владимир Тамбовцев on 12.11.2022.
//

import SwiftUI

struct TodoView: View {
    var todo: Todo
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("Name: ").font(.caption).foregroundColor(.secondary)
                    Text(todo.name)
                }
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Date: ").font(.caption).foregroundColor(.secondary)
                    Text(todo.date, style: .date)
                }
                
                Text("Target: ").font(.caption).foregroundColor(.secondary)
                Text(todo.target)
            }
        }
    }
}
//
//struct TodoView_Previews: PreviewProvider {
//    static var previews: some View {
//        TodoView()
//    }
//}
