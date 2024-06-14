//
//  User.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation

struct User: Codable {
    
    private struct Constants {
        static let firstName = "John"
        static let lastName = "Doe"
        static let details = "Globe-trotter, fearless adventurer, cultural enthusiast, storyteller"
        static let avatarFileName = "avatar"
        static let avatarFileExt = "png"
    }
    
    var firstName: String
    var lastName: String
    var details: String
    var avatarUrl: URL
    
    var fullName: String {
        [firstName, lastName].filter({ !$0.isEmpty }).joined(separator: " ")
    }
    
    static var mocked: Self {
        User(firstName: Constants.firstName,
             lastName: Constants.lastName,
             details: Constants.details,
             avatarUrl: Bundle.main.url(forResource: Constants.avatarFileName, withExtension: Constants.avatarFileExt)!)
    }
}

