//
//  Stylable.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation

protocol Stylable {
    associatedtype Style
    func applyStyle(_ style: Style) -> Self
}
