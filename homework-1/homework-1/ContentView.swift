//
//  ContentView.swift
//  homework-1
//
//  Created by Владимир Тамбовцев on 10.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var tabSelection = 1

    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.darkGray
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
    }
    var body: some View {
        TabView(selection: $tabSelection) {
            ScreenOne(tabSelection: $tabSelection)
                .tabItem {
                    Image.init(systemName: "video.bubble.left.fill")
                    Text("Home")
                }
                .tag(1)
            ScreenTwo()
                .tabItem {
                    Image.init(systemName: "gamecontroller.fill")
                    Text("Settings")
                }
                .tag(2)
            ScreenThree()
                .tabItem {
                    Image.init(systemName: "person")
                    Text("Account")
                }
                .tag(3)
        }.accentColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
.previewInterfaceOrientation(.portrait)
    }
}
