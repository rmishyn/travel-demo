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
        static let summaryViewCornerRadius: CGFloat = 16
    }
    
    // MARK: Properties
    
    var viewModel: TravelCountriesViewModelProtocol!
    
    // MARK: UI elements
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var headerContentView: UIView!
    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var summaryView: UIView!
    @IBOutlet private weak var avatarContainerView: UIView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var userDetailsLabel: UILabel!
    @IBOutlet private weak var countriesTitleLabel: UILabel!
    @IBOutlet private weak var countriesValueLabel: UILabel!
    @IBOutlet private weak var worldTitleLabel: UILabel!
    @IBOutlet private weak var worldValueLabel: UILabel!
    @IBOutlet private weak var separatorView: UIView!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        guard let viewModel = viewModel else { fatalError("`viewModel` value is not set") }
        bind()
        viewModel.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateSizing()
    }
}

// MARK: - Private methods

@MainActor
private extension TravelCountriesViewController {
    
    func setupViews() {
        view.backgroundColor = .mainBackground
        headerContentView.backgroundColor = .mainBackground
        summaryView.backgroundColor = .listBackground
        avatarContainerView.backgroundColor = .listBackground
        avatarImageView.backgroundColor = .separator
        separatorView.backgroundColor = .separator
        tableView.backgroundColor = .listBackground
        
        userNameLabel.applyStyle(.body)
        userDetailsLabel.applyStyle(.footnote)
        [countriesValueLabel, worldValueLabel].forEach { $0?.applyStyle(.title2) }
        [countriesTitleLabel, worldTitleLabel].forEach { $0?.applyStyle(.subheadline) }
        mapView.applyStyle(.globe(defaultCoordinate: viewModel.defaultCoordinate))
        
        countriesTitleLabel.text = viewModel.countriesTitle
        worldTitleLabel.text = viewModel.worldTitle
    }
    
    func updateSizing() {
        tableView.beginUpdates()
        if let tableHeaderView = tableView.tableHeaderView {
            var headerFrame = tableHeaderView.frame
            headerFrame.size = headerContentView.frame.size
            tableHeaderView.frame = headerFrame
        }
        tableView.endUpdates()
        print("summaryView frame=\(summaryView.frame)")
        summaryView.roundCorners([.layerMinXMinYCorner, .layerMaxXMinYCorner], radius: Constants.summaryViewCornerRadius)
        [avatarContainerView, avatarImageView].forEach { $0?.roundCorners() }
    }
    
    func bind() {
        viewModel.userName.observe(on: self) { [weak self] userName in Task { await self?.updateUserName(with: userName) } }
        viewModel.userDetails.observe(on: self) { [weak self] userDetails in Task { await self?.updateUserDetails(with: userDetails)} }
        viewModel.userAvatarUrl.observe(on: self) { [weak self] url in Task { await self?.updateUserAvatar(with: url)} }
        viewModel.numberOfCountries.observe(on: self) { [weak self] numberOfCountries in
            Task { await self?.updateNumberOfCountries(with: numberOfCountries)}
        }
        viewModel.worldPercentage.observe(on: self) { [weak self] worldPercentage in
            Task { await self?.updateWorlPercentage(with: worldPercentage)}
        }
    }
    
    func updateUserName(with name: String?) async {
        userNameLabel.text = name ?? "- -"
    }
    
    func updateUserDetails(with details: String?) async {
        userDetailsLabel.text = (details ?? "-\n")
    }
    
    func updateUserAvatar(with url: URL?) async {
        guard let url = url else {
            avatarImageView.image = nil
            return
        }
        do {
            let imageData = try await Data(url: url)
            avatarImageView.image = UIImage(data: imageData)
        } catch {
            avatarImageView.image = nil
        }
    }
    
    func updateNumberOfCountries(with value: Int?) async {
        countriesValueLabel.text = (value == nil) ? "-" : value!.stringValue
    }
    
    func updateWorlPercentage(with value: Int?) async {
        worldValueLabel.text = (value == nil) ? "-" : value!.stringValue + "%"
    }
}
