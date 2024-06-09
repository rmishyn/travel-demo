//
//  AppDelegateServiceContract.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation
import Swinject

typealias Resolver = Swinject.Resolver

protocol AppDelegateServiceProtocol {
    var dependenciesResolver: Resolver {get}
}
