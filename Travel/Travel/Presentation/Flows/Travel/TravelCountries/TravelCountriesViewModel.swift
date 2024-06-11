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
    
    private let getUserUseCase: any GetUserUseCase
    
    // MARK: TravelCountriesViewModelOutput
    
    var defaultCoordinate: CLLocationCoordinate2D { appConfiguration.defaultCoordinate }
    
    var userName: Observable<String?> = Observable(nil)
    var userDetails: Observable<String?> = Observable(nil)
    var userAvatarUrl: Observable<URL?> = Observable(nil)
    var numberOfCountries: Observable<Int?> = Observable(nil)
    var worldPercentage: Observable<Int?> = Observable(nil)
    
    let countriesTitle: String = "countries".localized
    var worldTitle: String = "world".localized
    
    // MARK: Lifecycle
    
    init(output: TravelCountriesOutput, configuration: TravelCountriesConfiguration) {
        self.output = output
        self.appConfiguration = configuration.appConfiguration
        self.getUserUseCase = configuration.getUserUseCase
    }
}

// MARK: - TravelCountriesViewModelInput

extension TravelCountriesViewModel {
    
    func viewDidLoad() {
        loadUserData()
    }
}

// MARK: - Private methods

private extension TravelCountriesViewModel {
    
    func loadUserData() {
        Task {
            let response = await getUserUseCase.perform(request: GetUserUseCaseRequest())
            switch response.result {
            case .success(let user):
                userName.value = user.fullName
                userDetails.value = user.details
                userAvatarUrl.value = user.avatarUrl
            case .failure:
                break
            }
        }
    }
}
