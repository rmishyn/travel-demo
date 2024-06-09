//
//  SceneCoordinator.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation

protocol SceneCoordinatorOutput: AnyObject {
    
}

class SceneCoordinator: AbstractCoordinator, Coordinator, ChildCoordinatorFinishing {
    
    enum Destination {
        case travel
    }
    
    // MARK: Properties
    
    private(set) weak var output: SceneCoordinatorOutput?
    
    // MARK: Lifecycle
    
    init(configuration: CoordinatorConfiguration<SceneCoordinatorOutput>, dependenciesResolver: Resolver) {
        self.output = configuration.output
        super.init(navigationController: configuration.navigationController, dependenciesResolver: dependenciesResolver)
    }
    
    deinit {
        
    }
    
    // MARK: Coordinator
    
    func start() {
        start(destination: .travel)
    }
    
    func start(destination: SceneCoordinator.Destination) {
        switch destination {
        case .travel:
            setTravel()
        }
    }
}

// MARK: - Private methods

private extension SceneCoordinator {
    
    func setTravel() {
        let configuration = CoordinatorConfiguration<TravelCoordinatorOutput>(navigationController: navigationController, output: self)
        let coordinator = TravelCoordinator(configuration: configuration, dependenciesResolver: dependenciesResolver)
        addChildCoordinator(coordinator)
        coordinator.start()
    }
}

// MARK: - TravelCoordinatorOutput

extension SceneCoordinator: TravelCoordinatorOutput {
    
}
