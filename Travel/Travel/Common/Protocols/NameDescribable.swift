//
//  NameDescribable.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation

/// Protocol supporting ability to get class name as string
protocol NameDescribable { }

extension NameDescribable {
    
    /// Name of instance type
    var typeName: String {
        String(describing: type(of: self))
    }
    
    /// Name of class/structure/etc.
    static var typeName: String {
        String(describing: self)
    }
    
    /// Class identifier
    static var identifier: String {
        typeName
    }
}
