//
//  MKMapView+Styling.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import MapKit
import CoreLocation

// MARK: - Stylable

extension MKMapView: Stylable {
    
    enum UIStyle {
        case globe(defaultCoordinate: CLLocationCoordinate2D)
    }
    
    typealias Style = MKMapView.UIStyle
    
    @discardableResult
    func applyStyle(_ style: Style) -> Self {
        switch style {
        case .globe(let defaultCoordinate):
            alpha = 0
            let configuration = MKHybridMapConfiguration(elevationStyle: .realistic)
            configuration.pointOfInterestFilter = .excludingAll
            configuration.showsTraffic = false
            preferredConfiguration = configuration
            Task {
                let coordinate = await getRegionCenterCoordinate() ?? defaultCoordinate
                zoomOutToGlobe(focusOn: coordinate)
                UIView.animate(withDuration: 0.2, animations: { [weak self] in self?.alpha = 1 })
            }
        }
        return self
    }
    
    private func getRegionCenterCoordinate() async -> CLLocationCoordinate2D? {
        var coordinate: CLLocationCoordinate2D?
        if let region = Locale.current.region?.identifier {
            
            let placemarks: [CLPlacemark]
            let geocoder = CLGeocoder()
            do {
                placemarks = try await geocoder.geocodeAddressString(region)
            } catch {
                placemarks = []
            }
            if let placemark = placemarks.first {
                coordinate = placemark.location?.coordinate
            }
        }
        return coordinate
    }
    
    @MainActor
    private func zoomOutToGlobe(focusOn center: CLLocationCoordinate2D) {
        let mapHeight = bounds.height // the constraint of visible Map area will base on HEIGHT of mapview

        // These are standard/base value from adjustment
        let standardMapHeight: CGFloat = 450
        let standardCameraDistance: CGFloat = 24 * 1000 * 1000 // 24,000 km
        
        let targetDistance = (mapHeight / standardMapHeight) * standardCameraDistance
        let camera = MKMapCamera(lookingAtCenter: center, fromDistance: targetDistance, pitch: 0, heading: 0)
        setCamera(camera, animated: false)
    }
}
