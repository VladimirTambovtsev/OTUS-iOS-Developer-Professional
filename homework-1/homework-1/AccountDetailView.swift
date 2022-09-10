//
//  AccountDetailView.swift
//  homework-1
//
//  Created by Владимир Тамбовцев on 10.09.2022.
//

import SwiftUI

struct AccountDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var title: String

     var btnBack : some View { Button(action: {
         self.presentationMode.wrappedValue.dismiss()
         }) {
             HStack {
             Image("ic_back") // set image here
                 .aspectRatio(contentMode: .fit)
                 .foregroundColor(.black)
                 Text("Go back")
             }
         }
     }
     
     var body: some View {
             List {
                 Text(title)
         }
//         .navigationBarBackButtonHidden(true)
//         .navigationBarItems(leading: btnBack)
     }
}

struct AccountDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AccountDetailView(title: "Title 1")
    }
}
