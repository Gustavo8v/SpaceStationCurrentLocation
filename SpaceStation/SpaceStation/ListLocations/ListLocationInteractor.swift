//
//  ListLocationInteractor.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation

class ListLocationInteractor: ListLocationInteractorInputProtocol {
    
    // MARK: Properties
    weak var presenter: ListLocationInteractorOutputProtocol?
    var localDatamanager: ListLocationLocalDataManagerInputProtocol?
    var remoteDatamanager: ListLocationRemoteDataManagerInputProtocol?
    
    func saveObject(object: LocationModelRealm) {
        localDatamanager?.setObjectFavourite(object: object)
    }
    
    func reloadDBLocations() {
        presenter?.reloadTableLocations()
    }
}

extension ListLocationInteractor: ListLocationRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
