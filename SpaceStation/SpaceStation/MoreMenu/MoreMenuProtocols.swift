//
//  MoreMenuProtocols.swift
//  SpaceStation
//
//  Created by Gustavo on 12/05/22.
//  
//

import Foundation
import UIKit

protocol MoreMenuViewProtocol: AnyObject {
    // PRESENTER -> VIEW
    var presenter: MoreMenuPresenterProtocol? { get set }
    
    func configureUI()
}

protocol MoreMenuWireFrameProtocol: AnyObject {
    // PRESENTER -> WIREFRAME
    var view: MoreMenuView { get set }
    var presenter: MoreMenuPresenter { get set }
    
    func goToListLocationView()
}

protocol MoreMenuPresenterProtocol: AnyObject {
    // VIEW -> PRESENTER
    var view: MoreMenuViewProtocol? { get set }
    var wireFrame: MoreMenuWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func prepareOptionsMoreMenu() -> [String]
    func goToHistory()
}

protocol MoreMenuInteractorOutputProtocol: AnyObject {
// INTERACTOR -> PRESENTER
}
