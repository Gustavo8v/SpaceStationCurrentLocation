//
//  ShowMapInteractor.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation

class ShowMapInteractor: ShowMapInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: ShowMapInteractorOutputProtocol?
    var localDatamanager: ShowMapLocalDataManagerInputProtocol?
    var remoteDatamanager: ShowMapRemoteDataManagerInputProtocol?

}

extension ShowMapInteractor: ShowMapRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
