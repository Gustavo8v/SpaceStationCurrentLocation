//
//  FavoutiteLocationsWireFrame.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit

class FavoutiteLocationsWireFrame: FavoutiteLocationsWireFrameProtocol {

    class func createFavoutiteLocationsModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "FavoutiteLocationsView")
        if let view = navController.children.first as? FavoutiteLocationsView {
            let presenter: FavoutiteLocationsPresenterProtocol & FavoutiteLocationsInteractorOutputProtocol = FavoutiteLocationsPresenter()
            let interactor: FavoutiteLocationsInteractorInputProtocol & FavoutiteLocationsRemoteDataManagerOutputProtocol = FavoutiteLocationsInteractor()
            let localDataManager: FavoutiteLocationsLocalDataManagerInputProtocol = FavoutiteLocationsLocalDataManager()
            let remoteDataManager: FavoutiteLocationsRemoteDataManagerInputProtocol = FavoutiteLocationsRemoteDataManager()
            let wireFrame: FavoutiteLocationsWireFrameProtocol = FavoutiteLocationsWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "FavoutiteLocationsView", bundle: Bundle.main)
    }
    
}
