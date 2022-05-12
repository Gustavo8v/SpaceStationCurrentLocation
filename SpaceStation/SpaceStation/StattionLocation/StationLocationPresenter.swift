//
//  StationLocationPresenter.swift
//  SpaceStation
//
//  Created by Gustavo on 11/05/22.
//  
//

import Foundation
import CoreLocation
import MapKit

class StationLocationPresenter  {
    
    // MARK: Properties
    weak var view: StationLocationViewProtocol?
    var interactor: StationLocationInteractorInputProtocol?
    var wireFrame: StationLocationWireFrameProtocol?
    
}

extension StationLocationPresenter: StationLocationPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.configureUI()
    }
    
    func getLocationStation() {
        interactor?.getLocations()
    }
}

extension StationLocationPresenter: StationLocationInteractorOutputProtocol {
    // TODO: implement interactor output methods
    func bringCLLocation(location: CLLocation) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: location.coordinate.latitude,
                                                       longitude: location.coordinate.longitude)
        annotation.title = "Space Station"
        view?.setLoactionInMap(latitude: location.coordinate.latitude,
                               longitude: location.coordinate.longitude,
                               pin: annotation)
    }
}
