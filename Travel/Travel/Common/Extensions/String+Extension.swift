//
//  String+Extension.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation

extension String {
    var localized: String { NSLocalizedString(self, comment: "") }
    
    var intValue: Int? { Int(self) }
    
    var doubleValue: Double? { Double(self) }
}
