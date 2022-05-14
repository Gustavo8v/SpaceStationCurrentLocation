//
//  StationLocationWireFrame.swift
//  SpaceStation
//
//  Created by Gustavo on 11/05/22.
//  
//

import Foundation
import UIKit

class StationLocationWireFrame: StationLocationWireFrameProtocol {
    var view: StationLocationView
    var presenter: StationLocationPresenter
    var interactor: StationLocationInteractor
    var localDatamanager: StationLocationLocalDataManagerInputProtocol
    var remoteDatamanager: StationLocationRemoteDataManagerInputProtocol
    init(){
        self.view = StationLocationView()
        self.presenter = StationLocationPresenter()
        self.interactor = StationLocationInteractor()
        self.localDatamanager = StationLocationLocalDataManager()
        self.remoteDatamanager = StationLocationRemoteDataManager()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.wireFrame = self
        interactor.presenter = self.presenter
        interactor.localDatamanager = self.localDatamanager
        interactor.remoteDatamanager = self.remoteDatamanager
        remoteDatamanager.remoteRequestHandler = self.interactor
    }
    
    func startMoreMenu() {
        let vc = MoreMenuWireFrame().view
        vc.delegate = view.self
        vc.modalPresentationStyle = .overFullScreen
        view.present(vc, animated: true)
    }
    
    func goFavouritesView() {
        let vc = FavoutiteLocationsWireFrame().view
        view.navigationController?.pushViewController(vc, animated: true)
    }
}
