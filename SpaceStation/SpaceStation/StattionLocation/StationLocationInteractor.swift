//
//  StationLocationInteractor.swift
//  SpaceStation
//
//  Created by Gustavo on 11/05/22.
//  
//

import Foundation
import CoreLocation

class StationLocationInteractor: StationLocationInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: StationLocationInteractorOutputProtocol?
    var localDatamanager: StationLocationLocalDataManagerInputProtocol?
    var remoteDatamanager: StationLocationRemoteDataManagerInputProtocol?

}

extension StationLocationInteractor: StationLocationRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    
    func getLocations() {
        remoteDatamanager?.connectServiceLocations()
    }
    
    func bringLocation(location: LocationDTOResponse) {
        let latitude = Double(location.iss?.latitude ?? "") ?? .zero
        let longitude = Double(location.iss?.latitude ?? "") ?? .zero
        let location = CLLocation(latitude: latitude,
                                  longitude: longitude)
        presenter?.bringCLLocation(location: location)
    }
}
