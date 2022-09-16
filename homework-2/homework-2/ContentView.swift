//
//  ContentView.swift
//  homework-2
//
//  Created by Владимир Тамбовцев on 16.09.2022.
//

import SwiftUI
import Network

struct ContentView: View {    
    var body: some View {
        NavigationView {
            Home()
                .navigationBarTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Home: View {
//    OPENAPI VM
    @StateObject var newsVM: NewsViewModel = .init()
    
    var body: some View {
        List(0..<newsVM.data.count, id: \.self) { i in
            if i == self.newsVM.data.count - 1 {
                CellView(data: self.newsVM.data[i], isLast: true, listData: self.newsVM)
            } else {
                CellView(data: self.newsVM.data[i], isLast: false, listData: self.newsVM)
            }
        }
    }
}


