//
//  ListLocationLocalDataManager.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import RealmSwift

class ListLocationLocalDataManager: ListLocationLocalDataManagerInputProtocol {
    
    let realm = try! Realm()
    var db = try! Realm().objects(LocationModelRealm.self)
    var interactor: ListLocationInteractorInputProtocol?
    
    func setObjectFavourite(object: LocationModelRealm) {
        let editLocation = db.filter("location == '\(object.location)'").first
        try! realm.write{
            editLocation?.isFavourite = !(editLocation?.isFavourite ?? false)
        }
        interactor?.reloadDBLocations()
    }
}
