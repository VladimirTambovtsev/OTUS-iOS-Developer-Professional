//
//  ModalView.swift
//  homework-1
//
//  Created by Владимир Тамбовцев on 10.09.2022.
//

import SwiftUI

struct ModalView: View {
    @Binding var isShowing: Bool
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            if isShowing {
                Color.black
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing = false
                    }
                
                VStack {
                    Text("Modal").foregroundColor(.black).offset(y: -50)
                }
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .transition(.move(edge: .bottom))
                //            .backgroundColor(Color.black)
            }
            else {
                Text("Not opened")
            }
        }.frame(maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .bottom
        )
            .ignoresSafeArea()
            .animation(.easeInOut)
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(isShowing: .constant(true))
    }
}
