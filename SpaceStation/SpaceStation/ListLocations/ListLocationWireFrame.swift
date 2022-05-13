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

    class func createListLocationModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ListLocationView")
        if let view = navController.children.first as? ListLocationView {
            let presenter: ListLocationPresenterProtocol & ListLocationInteractorOutputProtocol = ListLocationPresenter()
            let interactor: ListLocationInteractorInputProtocol & ListLocationRemoteDataManagerOutputProtocol = ListLocationInteractor()
            let localDataManager: ListLocationLocalDataManagerInputProtocol = ListLocationLocalDataManager()
            let remoteDataManager: ListLocationRemoteDataManagerInputProtocol = ListLocationRemoteDataManager()
            let wireFrame: ListLocationWireFrameProtocol = ListLocationWireFrame()
            
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
        return UIStoryboard(name: "ListLocationView", bundle: Bundle.main)
    }
    
}
