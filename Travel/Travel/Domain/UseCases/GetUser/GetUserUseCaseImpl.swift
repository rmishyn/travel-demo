//
//  GetUserUseCaseImpl.swift
//  Travel
//
//  Created by Ruslan Mishyn on 11.06.2024.
//

import Foundation

final class GetUserUseCaseImpl: GetUserUseCase {
    
    private let repository: UserInfoRepository
    
    init(repository: UserInfoRepository) {
        self.repository = repository
    }
    
    func execute(request: GetUserUseCaseRequest) async -> GetUserUseCaseResponse {
        do {
            let res = try await repository.getUserInfo()
            return GetUserUseCaseResponse(request: request, result: .success(res))
        } catch {
            return GetUserUseCaseResponse(request: request, result: .failure(error))
        }
    }
}
