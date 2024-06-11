//
//  GetUserUseCase.swift
//  Travel
//
//  Created by Ruslan Mishyn on 11.06.2024.
//

import Foundation

struct GetUserUseCaseRequest { }
struct GetUserUseCaseResponse { 
    let request: GetUserUseCaseRequest
    let result: Result<User, Error>
}

protocol GetUserUseCase: UseCase where UseCaseRequest == GetUserUseCaseRequest, UseCaseResponse == GetUserUseCaseResponse {
    
}
