//
//  UserInfoStorageImpl.swift
//  Travel
//
//  Created by Ruslan Mishyn on 12.06.2024.
//

import Foundation

final class UserInfoStorageImpl {
    
    private struct CacheKey {
        static let user = "user"
    }
    
    // MARK: Properties
    
    private var filePath: String {
        NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first! + "/ucache"
    }
    
    private var fileUrl: URL { URL(filePath: filePath) }
}

// MARK: - UserInfoStorage

extension UserInfoStorageImpl: UserInfoStorage {
    
    func getUserInfo() async throws -> User {
        var user: User?
        if let _user = unarchiveUser() {
            user = _user
        } else {
            user = User.mocked
            do {
                try archive(user: user!)
            }
        }
        
        if let user = user {
            return user
        } else {
            let domain = NSError.errorDomain(with: ["userInfoStorage", "getUserInfo"])
            throw NSError(domain: domain, code: 0, userInfo: [NSLocalizedDescriptionKey:"User info doesn't exist in storage"])
        }
    }
}

// MARK: - Private methods

private extension UserInfoStorageImpl {
    
    func archive(user: User) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(user)
            try data.write(to: fileUrl)
        } catch {
            throw error
        }
    }
    
    func unarchiveUser() -> User? {
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileUrl)
            let user = try decoder.decode(User.self, from: data)
            return user
        } catch {
            return nil
        }
    }
}
