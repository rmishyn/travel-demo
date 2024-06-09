//
//  AbstractCoordinator.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import UIKit

@MainActor
class AbstractCoordinator {
    
    // MARK: Properties
    
    var childCoordinators: [any Coordinator] = []
    var navigationController: UINavigationController
    var _pushedViewControllers: [Weak<UIViewController>] = []
    let dependenciesResolver: Resolver
    
    // MARK: Lifecycle
    
    init(navigationController: UINavigationController, dependenciesResolver: Resolver) {
        self.navigationController = navigationController
        self.dependenciesResolver = dependenciesResolver
    }
}

// MARK: - Navigation

extension AbstractCoordinator {
    
}
