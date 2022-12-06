//
//  IService.swift
//  SwiftServiceLocator
//
//  Created by Vladimir Tambovtsev on 25/02/2022.
//

import Foundation

/// Expose ServiceAbstraction protocol rather than Service Implementation
public protocol ServiceAbstraction {
    func doStuff()
}
