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

}

extension FavoutiteLocationsInteractor: FavoutiteLocationsRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
