//
//  ListLocationPresenter.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import RealmSwift

class ListLocationPresenter  {
    // MARK: Properties
    weak var view: ListLocationViewProtocol?
    var interactor: ListLocationInteractorInputProtocol?
    var wireFrame: ListLocationWireFrameProtocol?
    
}

extension ListLocationPresenter: ListLocationPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.configureUI()
    }
    
    func getDataBaseLocations() -> Results<LocationModelRealm> {
        let locations = try! Realm().objects(LocationModelRealm.self)
        return locations
    }
    
    func markFavourite(object: LocationModelRealm) {
        interactor?.saveObject(object: object)
    }
    
    func reloadTableLocations() {
        view?.reloadTable()
    }
}

extension ListLocationPresenter: ListLocationInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
