//
//  Store.swift
//  homework-4
//
//  Created by Владимир Тамбовцев on 12.11.2022.
//

import Foundation

final class Store: ObservableObject {
    @Published
    var isPresented = false
    
    @Published
    var sorted: SortType = .order
    
    @Published
    private (set) var state: AppState
    
    init(state: AppState = .init(todos: [Todo](), sortType: .order)) {
        self.state = state
    }
    
    func dispatch(action: Action) {
        reducer(state: &state, action: action) { newState in
            DispatchQueue.main.async { [self] in
                state = newState
            }
        }
    }
}
