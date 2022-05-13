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
}

protocol ListLocationInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol ListLocationInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ListLocationInteractorOutputProtocol? { get set }
    var localDatamanager: ListLocationLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ListLocationRemoteDataManagerInputProtocol? { get set }
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
}
