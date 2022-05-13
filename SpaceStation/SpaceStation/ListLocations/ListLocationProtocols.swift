//
//  ListLocationProtocols.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit

protocol ListLocationViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ListLocationPresenterProtocol? { get set }
}

protocol ListLocationWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createListLocationModule() -> UIViewController
}

protocol ListLocationPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ListLocationViewProtocol? { get set }
    var interactor: ListLocationInteractorInputProtocol? { get set }
    var wireFrame: ListLocationWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol ListLocationInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol ListLocationInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ListLocationInteractorOutputProtocol? { get set }
    var localDatamanager: ListLocationLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ListLocationRemoteDataManagerInputProtocol? { get set }
}

protocol ListLocationDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ListLocationRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ListLocationRemoteDataManagerOutputProtocol? { get set }
}

protocol ListLocationRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ListLocationLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
