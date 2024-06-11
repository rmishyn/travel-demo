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
        
        diContainer.register(UserInfoRepository.self) { _ in UserInfoRepositoryImpl() }
        
        diContainer.register((any GetUserUseCase).self) { resolver in GetUserUseCaseImpl(repository: resolver.resolve(UserInfoRepository.self)!) }
        
        self.diContainer = diContainer
    }
}
