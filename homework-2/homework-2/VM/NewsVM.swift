//
//  NewsVM.swift
//  homework-2
//
//  Created by Владимир Тамбовцев on 16.09.2022.
//

import Foundation
import SwiftUI
import Network


final class NewsViewModel: ObservableObject {
    @Published var articles: [ArticleList] = .init()
    
    @Published var data = [ArticleListResponseDocsInner]()
    @Published var count = 1

    init() {
        fetchData()
    }
    
    func fetchData() {
        ArticlesAPI.everythingGet(count: count, rows: 10, q: "title:DNA") { data, error in
            let oldData = self.data
            self.data = oldData + data!.response.docs
            self.count += 10
            print(error)
            print(data)
        }
    }
}
