//
//  ContentView.swift
//  homework-4
//
//  Created by Владимир Тамбовцев on 12.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                SortPickerView()
                TodoListView()
            }
            .modifier(ContentViewModel())
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
