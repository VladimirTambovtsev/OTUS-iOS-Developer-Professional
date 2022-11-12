//
//  SortPickerView.swift
//  homework-4
//
//  Created by Владимир Тамбовцев on 13.11.2022.
//

import SwiftUI

struct SortPickerView: View {
    @EnvironmentObject
    var store: Store
    
    var body: some View {
        Picker(selection: $store.sorted, label: Text("")) {
            ForEach(SortType.allCases) {
                Text($0.rawValue.capitalized)
                    .tag($0)
            }
        }.pickerStyle(SegmentedPickerStyle())
            .padding()
    }
}

struct SortPickerView_Previews: PreviewProvider {
    static var previews: some View {
        SortPickerView()
    }
}
