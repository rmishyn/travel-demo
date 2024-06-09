//
//  TravelCountriesContract.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation

typealias TravelCountriesViewModelProtocol = TravelCountriesViewModelInput & TravelCountriesViewModelOutput

protocol TravelCountriesViewModelInput: AnyObject {
    func viewDidLoad()
}

protocol TravelCountriesViewModelOutput: AnyObject {

}

protocol TravelCountriesOutput: AnyObject {
    
}

