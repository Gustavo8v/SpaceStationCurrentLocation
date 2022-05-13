//
//  ListLocationWireFrame.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit

class ListLocationWireFrame: ListLocationWireFrameProtocol {
    var view: ListLocationView
    var presenter: ListLocationPresenter
    var interactor: ListLocationInteractor
    var localDatamanager: ListLocationLocalDataManager
    var remoteDatamanager: ListLocationRemoteDataManager
    
    init(){
        self.view = ListLocationView()
        self.presenter = ListLocationPresenter()
        self.interactor = ListLocationInteractor()
        self.localDatamanager = ListLocationLocalDataManager()
        self.remoteDatamanager = ListLocationRemoteDataManager()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.wireFrame = self
        interactor.presenter = self.presenter
        interactor.localDatamanager = self.localDatamanager
        interactor.remoteDatamanager = self.remoteDatamanager
        remoteDatamanager.remoteRequestHandler = self.interactor
    }
}
