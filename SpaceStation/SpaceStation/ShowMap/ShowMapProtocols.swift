//
//  ShowMapProtocols.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit
import CoreLocation

protocol ShowMapViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: ShowMapPresenterProtocol? { get set }
    var location: CLLocation? { get set }
    
    func configureUI()
}

protocol ShowMapWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    var view: ShowMapView { get set }
    var presenter: ShowMapPresenter { get set }
    var interactor: ShowMapInteractor { get set }
    var localDatamanager: ShowMapLocalDataManager { get set }
    var remoteDatamanager: ShowMapRemoteDataManager { get set}
}

protocol ShowMapPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: ShowMapViewProtocol? { get set }
    var interactor: ShowMapInteractorInputProtocol? { get set }
    var wireFrame: ShowMapWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol ShowMapInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}

protocol ShowMapInteractorInputProtocol: AnyObject {
    // PRESENTER -> INTERACTOR
    var presenter: ShowMapInteractorOutputProtocol? { get set }
    var localDatamanager: ShowMapLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ShowMapRemoteDataManagerInputProtocol? { get set }
}

protocol ShowMapDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> DATAMANAGER
}

protocol ShowMapRemoteDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ShowMapRemoteDataManagerOutputProtocol? { get set }
}

protocol ShowMapRemoteDataManagerOutputProtocol: AnyObject {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ShowMapLocalDataManagerInputProtocol: AnyObject {
    // INTERACTOR -> LOCALDATAMANAGER
}
