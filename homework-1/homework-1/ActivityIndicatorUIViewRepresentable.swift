//
//  ActivityIndicatorUIViewRepresentable.swift
//  homework-1
//
//  Created by Владимир Тамбовцев on 11.09.2022.
//

import UIKit
import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    var style: UIActivityIndicatorView.Style
    var isLoading: Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        isLoading ? uiView.startAnimating() : uiView.stopAnimating()
    }
    
}
