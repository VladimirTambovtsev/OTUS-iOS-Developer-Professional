//
//  ScreenTwo.swift
//  homework-1
//
//  Created by Владимир Тамбовцев on 10.09.2022.
//

import SwiftUI

struct ScreenTwo: View {
    var list = ["Settings", "Privacy", "Security", "About"]
    
    var body: some View {
        NavigationView {
            List (list, id: \.self) {item in
                NavigationLink(
                    destination: AccountDetailView(title: item)
                , label: {
                    HStack {
                        Text(item).fontWeight(.semibold).lineLimit(2).minimumScaleFactor(0.5)
                    }
                    })
                }
        }.navigationBarTitle("Account").accentColor(.black).foregroundColor(.black)
       
    }
}

struct ScreenTwo_Previews: PreviewProvider {
    static var previews: some View {
        ScreenTwo()
    }
}
