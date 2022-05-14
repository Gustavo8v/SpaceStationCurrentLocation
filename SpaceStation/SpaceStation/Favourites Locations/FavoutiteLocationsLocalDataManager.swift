//
//  FavoutiteLocationsLocalDataManager.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import RealmSwift

class FavoutiteLocationsLocalDataManager:FavoutiteLocationsLocalDataManagerInputProtocol {
    
    var interactor: FavoutiteLocationsInteractorInputProtocol?
    var db = try! Realm().objects(LocationModelRealm.self)
    let realm = try! Realm()
    var locationsFavourites: [LocationModelRealm] = []
    
    func favouritesLocations() {
        db.forEach { location in
            if location.isFavourite == true {
                locationsFavourites.append(location)
            }
        }
        interactor?.bringDataBase(db: locationsFavourites)
    }
    
    func changeStateFavoutiyeLocation(location: LocationModelRealm) {
        locationsFavourites.removeAll()
        let editLocation = db.filter("location == '\(location.location)'").first
        try! realm.write {
            editLocation?.isFavourite = !(editLocation?.isFavourite ?? false)
        }
        db.forEach { location in
            if location.isFavourite == true {
                locationsFavourites.append(location)
            }
        }
        interactor?.reloadDB(db: locationsFavourites)
    }
}
