//
//  TravelCountriesBuilder.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import Foundation

struct TravelCountriesConfiguration {
    
}

struct TravelCountriesBuilder {
    
    typealias BuilderConfiguration = TravelCountriesConfiguration
    typealias BuilderOutput = TravelCountriesOutput
    typealias BuilderViewController = TravelCountriesViewController
    typealias BuilderViewModel = TravelCountriesViewModel
    
    func build(output: BuilderOutput, configuration: BuilderConfiguration) async -> BuilderViewController {
        let viewModel = BuilderViewModel(output: output, configuration: configuration)
        let viewController = await BuilderViewController.controllerFromStoryboard(.travel)
        await MainActor.run {
            viewController.viewModel = viewModel
        }
        return viewController
    }
}
