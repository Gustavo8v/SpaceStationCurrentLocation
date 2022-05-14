//
//  FavoutiteLocationsProtocols.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit
import CoreLocation

protocol FavoutiteLocationsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: FavoutiteLocationsPresenterProtocol? { get set }
    
    func configureUI()
    func reloadData()
}

protocol FavoutiteLocationsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    var view: FavoutiteLocationsView { get set }
    var presenter: FavoutiteLocationsPresenter { get set }
    var interactor: FavoutiteLocationsInteractor { get set }
    var localDatamanager: FavoutiteLocationsLocalDataManager { get set }
    var remoteDatamanager: FavoutiteLocationsRemoteDataManager { get set}
    
    func showLocationInMap(location: CLLocation)
}

protocol FavoutiteLocationsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: FavoutiteLocationsViewProtocol? { get set }
    var interactor: FavoutiteLocationsInteractorInputProtocol? { get set }
    var wireFrame: FavoutiteLocationsWireFrameProtocol? { get set }
    var favouritesList: [LocationModelRealm]? { get set }
    
    func viewDidLoad()
    func getFavouritesLocations()
    func editList(location: LocationModelRealm)
    func showLocationMap(latitude: String, longitude: String)
}

protocol FavoutiteLocationsInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func bringDataBase(data: [LocationModelRealm])
    func reloadTable(db: [LocationModelRealm])
}

protocol FavoutiteLocationsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: FavoutiteLocationsInteractorOutputProtocol? { get set }
    var localDatamanager: FavoutiteLocationsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: FavoutiteLocationsRemoteDataManagerInputProtocol? { get set }
    
    func setFavoutitesLocations()
    func bringDataBase(db: [LocationModelRealm])
    func editList(location: LocationModelRealm)
    func reloadDB(db: [LocationModelRealm])
}

protocol FavoutiteLocationsDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol FavoutiteLocationsRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: FavoutiteLocationsRemoteDataManagerOutputProtocol? { get set }
}

protocol FavoutiteLocationsRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol FavoutiteLocationsLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var interactor: FavoutiteLocationsInteractorInputProtocol? { get set }
    
    func favouritesLocations()
    func changeStateFavoutiyeLocation(location: LocationModelRealm)
}
