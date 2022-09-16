//
//  CellView.swift
//  homework-2
//
//  Created by Владимир Тамбовцев on 16.09.2022.
//

import SwiftUI
import Network

struct CellView: View {
    var data: ArticleListResponseDocsInner
    var isLast: Bool
    @ObservedObject var listData: NewsViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(data.articleType ?? "").fontWeight(.bold)
            Text(data.titleDisplay ?? "")
            if self.isLast {
                Text("").onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        if self.listData.data.count != 50 {
                            self.listData.fetchData()
                        }
                    }
                }
            }
        }.padding(.top, 10)
    }
}

