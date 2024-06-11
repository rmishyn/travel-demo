//
//  User.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation

struct User {
    var firstName: String
    var lastName: String
    var details: String
    var avatarUrl: URL
    
    var fullName: String {
        [firstName, lastName].filter({ !$0.isEmpty }).joined(separator: " ")
    }
}

