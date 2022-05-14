//
//  FavoutiteLocationsInteractor.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation

class FavoutiteLocationsInteractor: FavoutiteLocationsInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: FavoutiteLocationsInteractorOutputProtocol?
    var localDatamanager: FavoutiteLocationsLocalDataManagerInputProtocol?
    var remoteDatamanager: FavoutiteLocationsRemoteDataManagerInputProtocol?
    
    func setFavoutitesLocations() {
        localDatamanager?.favouritesLocations()
    }
    
    func editList(location: LocationModelRealm) {
        localDatamanager?.changeStateFavoutiyeLocation(location: location)
    }
    
    func reloadDB(db: [LocationModelRealm]) {
        presenter?.reloadTable(db: db)
    }
}

extension FavoutiteLocationsInteractor: FavoutiteLocationsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
    func bringDataBase(db: [LocationModelRealm]) {
        presenter?.bringDataBase(data: db)
    }
}
