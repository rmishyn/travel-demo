//
//  GetTravelCountriesContentProviderUseCase.swift
//  Travel
//
//  Created by Ruslan Mishyn on 13.06.2024.
//

import Foundation

struct GetTravelCountriesContentProviderUseCaseRequest { }
struct GetTravelCountriesContentProviderUseCaseResponse {
    let request: GetAllCountriesContentProviderUseCaseRequest
    let result: Result<any TravelCountriesContentProvider, Error>
}

protocol GetTravelCountriesContentProviderUseCase: UseCase where UseCaseRequest == GetTravelCountriesContentProviderUseCaseRequest, UseCaseResponse == GetTravelCountriesContentProviderUseCaseResponse {
    
}
