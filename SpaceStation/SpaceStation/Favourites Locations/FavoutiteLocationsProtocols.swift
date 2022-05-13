//
//  FavoutiteLocationsProtocols.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit

protocol FavoutiteLocationsViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: FavoutiteLocationsPresenterProtocol? { get set }
}

protocol FavoutiteLocationsWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createFavoutiteLocationsModule() -> UIViewController
}

protocol FavoutiteLocationsPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: FavoutiteLocationsViewProtocol? { get set }
    var interactor: FavoutiteLocationsInteractorInputProtocol? { get set }
    var wireFrame: FavoutiteLocationsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol FavoutiteLocationsInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol FavoutiteLocationsInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: FavoutiteLocationsInteractorOutputProtocol? { get set }
    var localDatamanager: FavoutiteLocationsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: FavoutiteLocationsRemoteDataManagerInputProtocol? { get set }
}

protocol FavoutiteLocationsDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol FavoutiteLocationsRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: FavoutiteLocationsRemoteDataManagerOutputProtocol? { get set }
}

protocol FavoutiteLocationsRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol FavoutiteLocationsLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
