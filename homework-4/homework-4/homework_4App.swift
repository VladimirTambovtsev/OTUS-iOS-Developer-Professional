//
//  homework_4App.swift
//  homework-4
//
//  Created by Владимир Тамбовцев on 12.11.2022.
//

import SwiftUI

@main
struct homework_4App: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Store())
        }
    }
}
