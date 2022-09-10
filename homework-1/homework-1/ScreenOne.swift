//
//  ScreenOne.swift
//  homework-1
//
//  Created by Владимир Тамбовцев on 10.09.2022.
//

import SwiftUI

struct ScreenOne: View {
    
    @Binding var tabSelection: Int
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Screen 1")
                Button(action: {
                    self.tabSelection = 2
                }) {
                    Text("Change to tab 2")
                        .foregroundColor(.black).padding(50)
                }
                
                
                NavigationLink(
                    destination: AccountDetailView(title: "Privacy")
                    , label: {
                        HStack {
                            Text("Go to tab 2 subscreen").fontWeight(.semibold).foregroundColor(.black).lineLimit(2).minimumScaleFactor(0.5)
                        }
                    })
            }
        }.navigationBarTitle("Privacy").accentColor(.black)
    }
}

struct ScreenOne_Previews: PreviewProvider {
    static var previews: some View {
        ScreenOne(tabSelection: .constant(0))
    }
}
