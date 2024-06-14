//
//  GetAllCountriesContentProviderUseCase.swift
//  Travel
//
//  Created by Ruslan Mishyn on 13.06.2024.
//

import Foundation

struct GetAllCountriesContentProviderUseCaseRequest { }
struct GetAllCountriesContentProviderUseCaseResponse {
    let request: GetAllCountriesContentProviderUseCaseRequest
    let result: Result<any AllCountriesContentProvider, Error>
}

protocol GetAllCountriesContentProviderUseCase: UseCase where UseCaseRequest == GetAllCountriesContentProviderUseCaseRequest, UseCaseResponse == GetAllCountriesContentProviderUseCaseResponse {
    
}
