//
//  StationLocationModel.swift
//  SpaceStation
//
//  Created by Gustavo on 11/05/22.
//

import Foundation
import RealmSwift

struct LocationDTOResponse: Codable {
    var message: String?
    var timestamp: Int?
    var iss: Position?
    
    enum CodingKeys: String, CodingKey {
        case iss = "iss_position"
    }
}

struct Position: Codable {
    var latitude: String?
    var longitude: String?
}

class LocationModelRealm: Object {
    @objc dynamic var location: String = ""
    @objc dynamic var latitude: String = ""
    @objc dynamic var longitude: String = ""
    @objc dynamic var date: String = ""
    @objc dynamic var isFavourite: Bool = false
}
