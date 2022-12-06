//
//  Initializable.swift
//  SwiftServiceLocator
//
//  Created by Vladimir Tambovtsev on 25/02/2022.
//

import Foundation

/// This protocol was implemented to allow dependency intializers to be registered in the container. By conforming to Initializable, dependencies can be constructed when needed, instead of relying on Singletons.
public protocol Initializable {
    init(container: IServiceContainer)
}
