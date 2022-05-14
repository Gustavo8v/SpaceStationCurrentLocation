//
//  FavoutiteLocationsWireFrame.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit
import CoreLocation

class FavoutiteLocationsWireFrame: FavoutiteLocationsWireFrameProtocol {
    var view: FavoutiteLocationsView
    var presenter: FavoutiteLocationsPresenter
    var interactor: FavoutiteLocationsInteractor
    var localDatamanager: FavoutiteLocationsLocalDataManager
    var remoteDatamanager: FavoutiteLocationsRemoteDataManager
    
    init(){
        self.view = FavoutiteLocationsView()
        self.presenter = FavoutiteLocationsPresenter()
        self.interactor = FavoutiteLocationsInteractor()
        self.localDatamanager = FavoutiteLocationsLocalDataManager()
        self.remoteDatamanager = FavoutiteLocationsRemoteDataManager()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.wireFrame = self
        interactor.presenter = self.presenter
        interactor.localDatamanager = self.localDatamanager
        interactor.remoteDatamanager = self.remoteDatamanager
        remoteDatamanager.remoteRequestHandler = self.interactor
        localDatamanager.interactor = self.interactor
    }
    
    func showLocationInMap(location: CLLocation) {
        let vc = ShowMapWireFrame(location: location).view
        view.present(vc, animated: true, completion: nil)
    }
}
