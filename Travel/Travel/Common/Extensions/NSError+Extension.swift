//
//  NSError+Extension.swift
//  Travel
//
//  Created by Ruslan Mishyn on 12.06.2024.
//

import Foundation

extension NSError {
    
    private struct Constants {
        static let baseErrorDomain = "com.rmishyn.travel"
    }
    
    static func errorDomain(with components: [String]) -> String {
        [[NSError.Constants.baseErrorDomain], components].flatMap({ $0 }).joined(separator: ".")
    }
}
