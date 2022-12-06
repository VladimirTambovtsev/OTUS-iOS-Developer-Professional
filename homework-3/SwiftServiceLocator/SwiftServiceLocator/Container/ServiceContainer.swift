//
//  ServiceContainer.swift
//  SwiftServiceLocator
//
//  Created by Vladimir Tambovtsev on 25/02/2022.
//

import Foundation
import os

/// Implementation of the IServiceContainer.
/// Dependencies are stored as a String(describing: Interface.Type), Implementation.Type pair & instances are retrieved using the resolve method.
///
/// Transient Dependencies:  A new service instance are provided every time it's requested.
///
/// Singleton Dependencies: A new instance is provided the first time a service is requested. That instance is then persisted for the lifetime of the app.
final class ServiceContainer: IServiceContainer {
    private let logger = Logger(subsystem: "Core", category: "Dependencies")
    private var transientDict: [String: TransientService] = [:]
    private var singletonDict: [String: SingletonService] = [:]

    /// Adds a Transient service, a new instance will be supplied on every request.
    func addTransient<T, V>(interfaceType: T.Type, implementingType: V.Type) where V: Initializable {
        transientDict.updateValue(
            TransientService(implementation: implementingType),
            forKey: String(describing: interfaceType)
        )
    }

    /// Adds a Singleton service, instances will be shared and reused.
    func addSingleton<T, V>(interfaceType: T.Type, implementingType: V.Type) where V: Initializable {
        singletonDict.updateValue(
            SingletonService(implementation: implementingType),
            forKey: String(describing: interfaceType)
        )
    }

    // MARK: Resolving Dependencies

    /// Given interface of Type T, request an implementing instance from the service container.
    ///
    ///  Does not resolve for Optional<T.Type>. If an optional dependency is needed, one can work around this issue with a backing variable of the non-optional interface type eg.
    ///
    ///     var service: IService?
    ///     let resolvedService: IService = container.resolve()
    ///     service = resolvedService
    ///
    /// - Returns: Implementing Instance of Type T
    func resolve<T>() -> T {
        let typeIdentifier = String(describing: T.self)

        // Check if dependency exists in Transient Dictionairy 
        if let transient = transientDict[typeIdentifier] {
            return transient.getInstance(container: self) as! T
        }

        // Check if dependency exists in Singleton Dictionairy
        if var singleton = singletonDict[typeIdentifier] {
            // Optionally Create the instance if it's nil
            if singleton.getInstance() == nil {
                let updatedValue = singleton.createInstance(container: self)
                singletonDict.updateValue(updatedValue, forKey: typeIdentifier)
            }
            return singleton.getInstance() as! T
        }

        logger.log(level: .fault, "tried to instantiate \(T.self) in the Service Container, but failed. Check registrations")
        print("tried to instantiate \(T.self) in the Service Container, but failed. Check registrations")
        fatalError()
    }
}
