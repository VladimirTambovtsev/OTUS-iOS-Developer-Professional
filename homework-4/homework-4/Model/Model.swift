//
//  Model.swift
//  homework-4
//
//  Created by Владимир Тамбовцев on 12.11.2022.
//

import Foundation
import SwiftUI

struct Todo: Identifiable, Codable {
    var id = UUID().uuidString
    let name, target: String
    let date: Date
    let priority: Priority
}

enum Priority: Int, Identifiable, CaseIterable, Codable {
    var id: Int { rawValue }
    case normal, medium, high
    var title: String {
        switch self {
        case .normal: return "Normal"
        case .medium: return "Medium"
        case .high: return "High"
        }
    }
    var color: Color {
        switch self {
        case.normal: return .blue
        case.medium: return .orange
        case.high: return .red
        }
    }
}


enum SortType: String, Identifiable, CaseIterable {
    var id: String { rawValue}
    case order, date, priority
}

struct AppState {
    var todos: [Todo]
    var sortType: SortType
}


enum Action{
    case addTodo(_:Todo)
    case removeTodo(_:IndexSet)
    case sort(_:SortType)
}


func reducer(state: inout AppState, action: Action, completion: @escaping(AppState) -> Void) {
    switch action {
    case .addTodo(let todo):
        state.todos.append(todo)
    case .removeTodo(let indexSet):
        state.todos.remove(atOffsets: indexSet)
    case .sort(let sortType):
        switch sortType {
        case .order:
            state.todos.sort(by: { $0.name < $1.name })
        case .date:
            state.todos.sort(by: { $0.date > $1.date })
        case .priority:
            state.todos.sort(by: { $0.priority.rawValue > $1.priority.rawValue })
        }
    }
    completion(state)
}


