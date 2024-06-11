//
//  UseCase.swift
//  Travel
//
//  Created by Ruslan Mishyn on 11.06.2024.
//

import Foundation

protocol UseCase {
    associatedtype UseCaseRequest
    associatedtype UseCaseResponse
    
    func perform(request: UseCaseRequest) async -> UseCaseResponse
}
