//
//  AddTodoView.swift
//  homework-4
//
//  Created by Владимир Тамбовцев on 13.11.2022.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var store: Store
    @State private var name = ""
    @State private var target = ""
    @State private var date = Date()
    @State private var priority: Priority = .normal
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("name...", text: $name)
                    TextField("target...", text: $target)
                }
                Section {
                    Picker(selection: $priority, label: Text("Priority")) {
                        ForEach(Priority.allCases) { priority in
                            Label(title: {Text(priority.title)}, icon: {
                                Image(systemName: "exclamationmark.triangle")
                            }).foregroundColor(priority.color).tag(priority)
                        }
                    }
                }
                DisclosureGroup("Date") {
                    DatePicker("", selection: $date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                Divider()
                
                Button(action: {
                    store.dispatch(action: .addTodo(.init(name: name, target: target, date: date, priority: priority)))
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Save")
                }.disabled(name.isEmpty || target.isEmpty)
            }
            .navigationBarTitle("Add", displayMode: .inline)
        }
    }
}
