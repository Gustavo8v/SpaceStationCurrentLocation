//
//  StationLocationLocalDataManager.swift
//  SpaceStation
//
//  Created by Gustavo on 11/05/22.
//  
//

import Foundation
import RealmSwift
import CoreLocation

class StationLocationLocalDataManager:StationLocationLocalDataManagerInputProtocol {
    
    let realm = try! Realm()
    var locationObject: LocationModelRealm?
    let currentDate = Date()
    
    func saveLocationInRealm(location: CLLocation) {
        let current = currentDate.timeIntervalSinceReferenceDate - 18000
        let locationRealm = LocationModelRealm()
        locationRealm.location = "latitude: \(location.coordinate.latitude.description), longitude: \(location.coordinate.longitude.description)"
        locationRealm.date = Date(timeIntervalSinceReferenceDate: current).description
        locationRealm.isFavourite = false
        locationRealm.latitude = location.coordinate.latitude.description
        locationRealm.longitude = location.coordinate.longitude.description
        DispatchQueue.main.async(execute: {
            try! self.realm.write {
                self.realm.add(locationRealm)
                self.locationObject = locationRealm
            }
        })
    }
    
    func deleteAllRegisters() {
        realm.beginWrite()
        let locationsdb = realm.objects(LocationModelRealm.self)
        realm.delete(locationsdb)
        try! realm.commitWrite()
    }
}
