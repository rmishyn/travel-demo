//
//  GetAllCountriesContentProviderUseCaseImpl.swift
//  Travel
//
//  Created by Ruslan Mishyn on 13.06.2024.
//

import Foundation

final class GetAllCountriesContentProviderUseCaseImpl: GetAllCountriesContentProviderUseCase {
    
    private let repository: CountriesRepository
    
    init(repository: CountriesRepository) {
        self.repository = repository
    }
    
    func execute(request: GetAllCountriesContentProviderUseCaseRequest) async -> GetAllCountriesContentProviderUseCaseResponse {
        do {
            let res = try await repository.getAllCountriesContentProvider()
            return GetAllCountriesContentProviderUseCaseResponse(request: request, result: .success(res))
        } catch {
            return GetAllCountriesContentProviderUseCaseResponse(request: request, result: .failure(error))
        }
    }
}
