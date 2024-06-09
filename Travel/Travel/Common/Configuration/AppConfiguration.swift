//
//  AppConfiguration.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation
import CoreLocation

protocol AppConfiguration {
    var defaultCoordinate: CLLocationCoordinate2D { get }
}
