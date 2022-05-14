//
//  ShowMapWireFrame.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit
import CoreLocation

class ShowMapWireFrame: ShowMapWireFrameProtocol {
    
    var view: ShowMapView
    var presenter: ShowMapPresenter
    var interactor: ShowMapInteractor
    var localDatamanager: ShowMapLocalDataManager
    var remoteDatamanager: ShowMapRemoteDataManager
    
    init(location: CLLocation){
        self.view = ShowMapView()
        self.presenter = ShowMapPresenter()
        self.interactor = ShowMapInteractor()
        self.localDatamanager = ShowMapLocalDataManager()
        self.remoteDatamanager = ShowMapRemoteDataManager()
        view.presenter = self.presenter
        view.location = location
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.wireFrame = self
        interactor.presenter = self.presenter
        interactor.localDatamanager = self.localDatamanager
        interactor.remoteDatamanager = self.remoteDatamanager
        remoteDatamanager.remoteRequestHandler = self.interactor
    }
}
