//
//  StationLocationProtocols.swift
//  SpaceStation
//
//  Created by Gustavo on 11/05/22.
//  
//

import Foundation
import UIKit
import CoreLocation
import MapKit

protocol StationLocationViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: StationLocationPresenterProtocol? { get set }
    
    func configureUI()
    func setLoactionInMap(latitude: Double, longitude: Double, pin: MKPointAnnotation)
}

protocol StationLocationWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    var view: StationLocationView { get set }
    var presenter: StationLocationPresenter { get set }
    var interactor: StationLocationInteractor { get set }
    var localDatamanager: StationLocationLocalDataManagerInputProtocol { get set }
    var remoteDatamanager: StationLocationRemoteDataManagerInputProtocol { get set}
    
    func startMoreMenu()
    func goFavouritesView()
}

protocol StationLocationPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: StationLocationViewProtocol? { get set }
    var interactor: StationLocationInteractorInputProtocol? { get set }
    var wireFrame: StationLocationWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func getLocationStation()
    func goMoreMenu()
    func deleteAllRegisters()
    func goToFavourites()
}

protocol StationLocationInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func bringCLLocation(location: CLLocation)
}

protocol StationLocationInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: StationLocationInteractorOutputProtocol? { get set }
    var localDatamanager: StationLocationLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: StationLocationRemoteDataManagerInputProtocol? { get set }
    
    func getLocations()
    func saveLocation(location: CLLocation)
    func deleteAllLocations()
}

protocol StationLocationDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol StationLocationRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: StationLocationRemoteDataManagerOutputProtocol? { get set }
    
    func connectServiceLocations()
}

protocol StationLocationRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
    func bringLocation(location: LocationDTOResponse)
}

protocol StationLocationLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    func saveLocationInRealm(location: CLLocation)
    func deleteAllRegisters()
}
