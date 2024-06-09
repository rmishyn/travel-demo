//
//  TravelCountriesViewModel.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation
import CoreLocation

class TravelCountriesViewModel: TravelCountriesViewModelProtocol {
    
    // MARK: Constants
    
    private struct Constants {
        static let delayedRequestTimeInterval: TimeInterval = 0.5
        static let repetitiveRequestTimeInterval: TimeInterval = 10
    }
    
    // MARK: Properties
    
    private let output: TravelCountriesOutput
    private let appConfiguration: AppConfiguration
    
    // MARK: UseCases
    
    // MARK: TravelCountriesViewModelOutput
    
    var defaultCoordinate: CLLocationCoordinate2D { appConfiguration.defaultCoordinate }
    
    // MARK: Lifecycle
    
    init(output: TravelCountriesOutput, configuration: TravelCountriesConfiguration) {
        self.output = output
        self.appConfiguration = configuration.appConfiguration
    }
}

// MARK: - TravelCountriesViewModelInput

extension TravelCountriesViewModel {
    
    func viewDidLoad() {
        
    }
}

// MARK: - Private methods

private extension TravelCountriesViewModel {
    
}
