//
//  CountriesRepositoryImpl.swift
//  Travel
//
//  Created by Ruslan Mishyn on 13.06.2024.
//

import Foundation

final class CountriesRepositoryImpl {
    
    // MARK: Properties
    
    private let collectionContentProvidersFactory: CollectionContentProvidersFactory
    
    // MARK: Lifecycle
    
    init(collectionContentProvidersFactory: CollectionContentProvidersFactory) {
        self.collectionContentProvidersFactory = collectionContentProvidersFactory
    }
}

// MARK: - CountriesRepository

extension CountriesRepositoryImpl: CountriesRepository {
    
//    func getAllCountriesContentProvider() async throws -> any AllCountriesContentProvider {
//        
//    }
//    
//    func getTravelCountriesContentProvider() async throws -> any TravelCountriesContentProvider {
//        
//    }
}
