//
//  FavoutiteLocationsPresenter.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import CoreLocation

class FavoutiteLocationsPresenter  {
    
    // MARK: Properties
    weak var view: FavoutiteLocationsViewProtocol?
    var interactor: FavoutiteLocationsInteractorInputProtocol?
    var wireFrame: FavoutiteLocationsWireFrameProtocol?
    var favouritesList: [LocationModelRealm]?
}

extension FavoutiteLocationsPresenter: FavoutiteLocationsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.configureUI()
    }
    
    func getFavouritesLocations() {
        interactor?.setFavoutitesLocations()
    }
    
    func bringDataBase(data: [LocationModelRealm]) {
        favouritesList = data
        view?.reloadData()
    }
    
    func editList(location: LocationModelRealm) {
        interactor?.editList(location: location)
    }
    
    func reloadTable(db: [LocationModelRealm]) {
        favouritesList = db
        view?.reloadData()
    }
    
    func showLocationMap(latitude: String, longitude: String) {
        let location = CLLocation(latitude: (Double(latitude) ?? .zero), longitude: (Double(longitude) ?? .zero))
        wireFrame?.showLocationInMap(location: location)
    }
}

extension FavoutiteLocationsPresenter: FavoutiteLocationsInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
