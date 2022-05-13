//
//  FavoutiteLocationsProtocols.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit

protocol FavoutiteLocationsViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: FavoutiteLocationsPresenterProtocol? { get set }
}

protocol FavoutiteLocationsWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    static func createFavoutiteLocationsModule() -> UIViewController
}

protocol FavoutiteLocationsPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: FavoutiteLocationsViewProtocol? { get set }
    var interactor: FavoutiteLocationsInteractorInputProtocol? { get set }
    var wireFrame: FavoutiteLocationsWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol FavoutiteLocationsInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol FavoutiteLocationsInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: FavoutiteLocationsInteractorOutputProtocol? { get set }
    var localDatamanager: FavoutiteLocationsLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: FavoutiteLocationsRemoteDataManagerInputProtocol? { get set }
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
}
