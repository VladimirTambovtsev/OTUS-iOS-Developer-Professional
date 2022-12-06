//
//  AppConfiguration.swift
//  Fleeki
//
//  Created by Vladimir Tambovtsev on 18/05/2022.
//

import Foundation

final class AppConfiguration {
    private enum RuntimeEnvironment {
        case Production
        case Test
        case Development
    }

    private lazy var runtimeEnvironment: RuntimeEnvironment = {
        guard let env = Bundle.main.object(forInfoDictionaryKey: "RuntimeEnvironment") as? String else {
            return RuntimeEnvironment.Development
        }

        switch env.lowercased() {
            case "production":
                return .Production
            case "test":
                return .Test
            default:
                return .Development
        }
    }()

    // Registers all Module Dependencies into the Core root.
    // The Domain Project contains the Container, since all subprojects will have knowledge of Domain.
    func registerApplicationServicesIn(container: IServiceContainer) {
        if runtimeEnvironment == .Production {
            // Register Prod dependencies
            ServiceModuleImpl(container: container).registerDependencies()
        } else {
            // Register Dev dependencies
            ServiceModuleImpl(container: container).registerDevDependencies()
        }
    }
}
