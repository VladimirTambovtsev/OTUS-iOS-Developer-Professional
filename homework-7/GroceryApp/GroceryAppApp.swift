//
//  GroceryAppApp.swift
//  GroceryApp
//
//  Created by Vladimir Tambovtsev on 11/10/22.
//

import SwiftUI

@main
struct GroceryAppApp: App {
    
    let migrator = Migrator() 
    
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path)
            ContentView()
        }
    }
}
