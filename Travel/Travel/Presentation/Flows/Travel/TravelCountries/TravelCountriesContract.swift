//
//  TravelCountriesContract.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation
import CoreLocation

typealias TravelCountriesViewModelProtocol = TravelCountriesViewModelInput & TravelCountriesViewModelOutput

protocol TravelCountriesViewModelInput: AnyObject {
    func viewDidLoad()
}

protocol TravelCountriesViewModelOutput: AnyObject {
    var defaultCoordinate: CLLocationCoordinate2D { get }
//    var countriesTitle: String { get }
//    var worldTitle: String { get }
//    var beenToTitle: String { get }
//    var bucketListTitle: String { get }
//    var addCountryTitle: String { get }
//    
//    var userName: Observable<String> { get }
//    var userDetails: Observable<String> { get }
}

protocol TravelCountriesOutput: AnyObject {
    
}

