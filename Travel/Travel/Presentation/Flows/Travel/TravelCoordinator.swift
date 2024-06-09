//
//  TravelCoordinator.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation

protocol TravelCoordinatorOutput: AnyObject {
    
}

class TravelCoordinator: AbstractCoordinator, Coordinator, ChildCoordinatorFinishing {
    
    enum Destination {
        case travelCountries
    }
    
    // MARK: Properties
    
    private(set) weak var output: TravelCoordinatorOutput?
    
    // MARK: Lifecycle
    
    init(configuration: CoordinatorConfiguration<TravelCoordinatorOutput>, dependenciesResolver: Resolver) {
        self.output = configuration.output
        super.init(navigationController: configuration.navigationController, dependenciesResolver: dependenciesResolver)
    }
    
    deinit {
        
    }
    
    // MARK: Coordinator
    
    func start() {
        start(destination: .travelCountries)
    }
    
    func start(destination: TravelCoordinator.Destination) {
        switch destination {
        case .travelCountries:
            setTravelCountries()
        }
    }
}

// MARK: - Private methods

private extension TravelCoordinator {
    
    func setTravelCountries() {
        Task {
            let configuration = TravelCountriesConfiguration(appConfiguration: dependenciesResolver.resolve(AppConfiguration.self)!)
            let viewController = await TravelCountriesBuilder().build(output: self, configuration: configuration)
            setToNavigationController(viewController: viewController, animated: false, completion: nil)
        }
    }
}

// MARK: - TravelCountriesOutput

extension TravelCoordinator: TravelCountriesOutput {
    
}
