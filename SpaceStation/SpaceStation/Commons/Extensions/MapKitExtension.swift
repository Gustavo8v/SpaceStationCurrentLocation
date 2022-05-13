//
//  MapKitExtension.swift
//  SpaceStation
//
//  Created by Gustavo on 11/05/22.
//

import Foundation
import MapKit

extension MKMapView {
    func centerToLocation( latitude: Double, longitude: Double, regionRadius: CLLocationDistance = 100000) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
    
    func deleteAllPins(){
        let allAnnotations = self.annotations
        self.removeAnnotations(allAnnotations)
    }
}
