//
//  UserInfoStorage.swift
//  Travel
//
//  Created by Ruslan Mishyn on 12.06.2024.
//

import Foundation

protocol UserInfoStorage {
    func getUserInfo() async throws -> User
}
