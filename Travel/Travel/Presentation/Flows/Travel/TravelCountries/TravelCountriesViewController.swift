//
//  TravelCountriesViewController.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import UIKit

@MainActor
class TravelCountriesViewController: UIViewController {
    
    struct Constants {
    }
    
    // MARK: Properties
    
    var viewModel: TravelCountriesViewModelProtocol?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = viewModel else { fatalError("`viewModel` value is not set") }
        viewModel.viewDidLoad()
    }
}
