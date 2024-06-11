//
//  UserInfoRepositoryImpl.swift
//  Travel
//
//  Created by Ruslan Mishyn on 11.06.2024.
//

import Foundation

final class UserInfoRepositoryImpl: UserInfoRepository {
    
    private struct Constants {
        static let firstName = "John"
        static let lastName = "Doe"
        static let details = "Globe-trotter, fearless adventurer, cultural enthusiast, storyteller"
        static let avatarFileName = "avatar"
        static let avatarFileExt = "png"
    }
    
    func getUserInfo() async throws -> User {
        User(firstName: Constants.firstName,
             lastName: Constants.lastName,
             details: Constants.details,
             avatarUrl: Bundle.main.url(forResource: Constants.avatarFileName, withExtension: Constants.avatarFileExt)!)
    }
}
