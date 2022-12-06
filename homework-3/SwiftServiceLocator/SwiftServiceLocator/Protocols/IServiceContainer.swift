//
//  IServiceContainer.swift
//  SwiftServiceLocator
//
//  Created by Vladimir Tambovtsev on 25/02/2022.
//

import Foundation

/// Description of Service Container Methods
public protocol IServiceContainer {
    func addTransient<T, V>(interfaceType: T.Type, implementingType: V.Type) where V: Initializable
    func addSingleton<T, V>(interfaceType: T.Type, implementingType: V.Type) where V: Initializable
    func resolve<T>() -> T
}
