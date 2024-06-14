//
//  UserInfoRepositoryImpl.swift
//  Travel
//
//  Created by Ruslan Mishyn on 11.06.2024.
//

import Foundation

final class UserInfoRepositoryImpl {
    
    // MARK: Properties
    
    private let userInfoStorage: UserInfoStorage
    
    // MARK: Lifecycle
    
    init(userInfoStorage: UserInfoStorage) {
        self.userInfoStorage = userInfoStorage
    }
}

// MARK: - UserInfoRepository

extension UserInfoRepositoryImpl: UserInfoRepository {
    
    func getUserInfo() async throws -> User {
        try await userInfoStorage.getUserInfo()
    }
}
