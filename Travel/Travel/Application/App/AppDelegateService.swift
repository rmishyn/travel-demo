//
//  AppDelegateService.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import UIKit
import Swinject

class AppDelegateService: AppDelegateServiceProtocol {
    
    // MARK: Properties
    
    
    private var diContainer: Container!
    var dependenciesResolver: Resolver { diContainer }
    
    // MARK: Lifecycle
    
    init() {
        setup()
    }
}

// MARK: - Private methods

private extension AppDelegateService {
    
    func setup() {
        setupDependencies()
    }
    
    func setupDependencies() {
        let diContainer = Container()
        diContainer.register(AppConfiguration.self) { _ in AppConfigurationImpl() }
        
        // Persistent storages
        diContainer.register(UserInfoStorage.self) { _ in UserInfoStorageImpl() }
        diContainer.register(CountriesStorage.self) { _ in CountriesStorageImpl() }
        
        // Others
        diContainer.register(CollectionContentProvidersFactory.self) { _ in CollectionContentProvidersFactoryImpl() }
        
        // Repositories
        diContainer.register(UserInfoRepository.self) { resolver in
            UserInfoRepositoryImpl(userInfoStorage: resolver.resolve(UserInfoStorage.self)!)
        }
        diContainer.register(CountriesRepository.self) { resolver in
            CountriesRepositoryImpl(collectionContentProvidersFactory: resolver.resolve(CollectionContentProvidersFactory.self)!)
        }
        
        // Use cases
        diContainer.register((any GetUserUseCase).self) { resolver in GetUserUseCaseImpl(repository: resolver.resolve(UserInfoRepository.self)!) }
        
        self.diContainer = diContainer
    }
}
