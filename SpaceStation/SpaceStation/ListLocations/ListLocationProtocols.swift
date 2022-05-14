//
//  ListLocationProtocols.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit
import RealmSwift

protocol ListLocationViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ListLocationPresenterProtocol? { get set }
    
    func configureUI()
    func reloadTable()
}

protocol ListLocationWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    var view: ListLocationView { get set }
    var presenter: ListLocationPresenter { get set }
    var interactor: ListLocationInteractor { get set }
    var localDatamanager: ListLocationLocalDataManager { get set }
    var remoteDatamanager: ListLocationRemoteDataManager { get set}
}

protocol ListLocationPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ListLocationViewProtocol? { get set }
    var interactor: ListLocationInteractorInputProtocol? { get set }
    var wireFrame: ListLocationWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func getDataBaseLocations() -> Results<LocationModelRealm>
    func markFavourite(object: LocationModelRealm)
}

protocol ListLocationInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
    func reloadTableLocations()
}

protocol ListLocationInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ListLocationInteractorOutputProtocol? { get set }
    var localDatamanager: ListLocationLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ListLocationRemoteDataManagerInputProtocol? { get set }
    
    func saveObject(object: LocationModelRealm)
    func reloadDBLocations()
}

protocol ListLocationDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ListLocationRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ListLocationRemoteDataManagerOutputProtocol? { get set }
}

protocol ListLocationRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ListLocationLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
    var interactor: ListLocationInteractorInputProtocol? { get set }
    func setObjectFavourite(object: LocationModelRealm)
}
