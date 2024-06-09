//
//  TravelCountriesViewModel.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation

class TravelCountriesViewModel: TravelCountriesViewModelProtocol {
    
    // MARK: Constants
    
    private struct Constants {
        static let delayedRequestTimeInterval: TimeInterval = 0.5
        static let repetitiveRequestTimeInterval: TimeInterval = 10
    }
    
    // MARK: Properties
    
    private let output: TravelCountriesOutput
    
    // MARK: UseCases
    
    // MARK: TravelCountriesViewModelOutput
    
    // MARK: Lifecycle
    
    init(output: TravelCountriesOutput, configuration: TravelCountriesConfiguration) {
        self.output = output
        
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
