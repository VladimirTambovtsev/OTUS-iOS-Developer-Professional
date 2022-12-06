//
//  TransientService.swift
//  SwiftServiceLocator
//
//  Created by Vladimir Tambovtsev on 25/02/2022.
//

import Foundation

struct TransientService {
    private let implementation: Initializable.Type

    internal init(implementation: Initializable.Type) {
        self.implementation = implementation
    }

    func getInstance(container: IServiceContainer) -> Initializable {
        return implementation.init(container: container)
    }
}
