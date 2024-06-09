//
//  Weak.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation

/// Weak object holding non-weak object
class Weak<T: AnyObject> {
    /// Holded value
    weak var value : T?
    /**
     Initializer
     - Parameter value: Value to be holded
     */
    init (value: T) {
        self.value = value
    }
}
