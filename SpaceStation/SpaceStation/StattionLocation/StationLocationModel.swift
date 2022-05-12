//
//  StationLocationModel.swift
//  SpaceStation
//
//  Created by Gustavo on 11/05/22.
//

import Foundation

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
