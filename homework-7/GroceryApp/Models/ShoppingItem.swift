//
//  ShoppingItem.swift
//  GroceryApp
//
//  Created by Vladimir Tambovtsev on 11/10/22.
//

import Foundation
import RealmSwift

class ShoppingItem: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var quantity: Int
    @Persisted var category: String
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
