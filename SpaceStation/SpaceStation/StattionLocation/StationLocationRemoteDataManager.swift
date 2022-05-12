//
//  StationLocationRemoteDataManager.swift
//  SpaceStation
//
//  Created by Gustavo on 11/05/22.
//  
//

import Foundation

class StationLocationRemoteDataManager:StationLocationRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: StationLocationRemoteDataManagerOutputProtocol?
    
    func connectServiceLocations() {
        let url = URL(string: "http://api.open-notify.org/iss-now.json?callback")
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request) { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            switch httpResponse?.statusCode {
            case 200:
                do {
                    if let jData = data {
                        let decodeData = try JSONDecoder().decode(LocationDTOResponse.self, from: jData)
                        self.remoteRequestHandler?.bringLocation(location: decodeData)
                    }
                } catch {
                    print("‼️ Error get location ‼️ func: -> connectServiceLocations")
                }
            default:
                print("‼️ Error get location ‼️ func: -> connectServiceLocations")
            }
        }.resume()
    }
}
