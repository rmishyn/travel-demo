//
//  TravelCountriesViewController.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import UIKit
import MapKit

@MainActor
class TravelCountriesViewController: UIViewController {
    
    struct Constants {
    }
    
    // MARK: Properties
    
    var viewModel: TravelCountriesViewModelProtocol!
    
    // MARK: UI elements
    
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        
        guard let viewModel = viewModel else { fatalError("`viewModel` value is not set") }
        viewModel.viewDidLoad()
    }
}

// MARK: - Private methods

private extension TravelCountriesViewController {
    
    func setupViews() {
        view.backgroundColor = .background
        mapView.applyStyle(.globe(defaultCoordinate: viewModel.defaultCoordinate))
    }
}
