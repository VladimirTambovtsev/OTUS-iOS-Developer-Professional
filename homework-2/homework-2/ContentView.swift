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
            VStack {
                NavigationLink("Tap me", destination: Text("Subscreen"))
            Home()
                .navigationBarTitle("Home")
            //            RootView()
            }
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
    @State var selectedTab = 1
    
    var body: some View {
        VStack {
            Picker(selection: $selectedTab, label: Text("Segmented Control"), content: {
                Text("DNA").tag(1)
                Text("Biology").tag(2)
            }).pickerStyle(SegmentedPickerStyle())
            
            if selectedTab == 1 {
                List(0..<newsVM.data.count, id: \.self) { i in
                    if i == self.newsVM.data.count - 1 {
                        CellView(listData: self.newsVM, data: self.newsVM.data[i], isLast: true, query: "title:DNA")
                    } else {
                        CellView(listData: self.newsVM, data: self.newsVM.data[i], isLast: false, query: "title:DNA")
                    }
                }.onAppear {
                    newsVM.clearData()
                    newsVM.fetchData(query: "title:DNA")
                }.onDisappear {
                    newsVM.clearData()
                }
            } else {
                List(0..<newsVM.data.count, id: \.self) { i in
                    if i == self.newsVM.data.count - 1 {
                        CellView(listData: self.newsVM, data: self.newsVM.data[i], isLast: true, query: "title:Biology")
                    } else {
                        CellView(listData: self.newsVM, data: self.newsVM.data[i], isLast: false, query: "title:Biology")
                    }
                }.onAppear {
                    newsVM.clearData()
                    newsVM.fetchData(query: "title:Biology")
                }.onDisappear {
                    newsVM.clearData()
                }
            }
        }
    }
}
