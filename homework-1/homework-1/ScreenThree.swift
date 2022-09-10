//
//  ScreenThree.swift
//  homework-1
//
//  Created by Владимир Тамбовцев on 10.09.2022.
//

import SwiftUI

struct ScreenThree: View {
    
    @State private var showModal = false
    
    @State private var isShowingPhoto = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .center) {
                Text("Custom UIKit component form UIViewRepresentable:").foregroundColor(.black)    .multilineTextAlignment(.center)
                ActivityIndicator(style: .large, isLoading: true)
            }.offset(y: -200)
          
            
            Spacer()
            
            Button(action: {
                showModal = true
            }) {
                Text("Open modal").foregroundColor(.black)
            }
            ModalView(isShowing: $showModal)
        }
    }
}

struct ScreenThree_Previews: PreviewProvider {
    static var previews: some View {
        ScreenThree()
    }
}

