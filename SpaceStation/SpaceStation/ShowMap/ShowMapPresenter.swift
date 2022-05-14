//
//  ShowMapPresenter.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation

class ShowMapPresenter  {
    
    // MARK: Properties
    weak var view: ShowMapViewProtocol?
    var interactor: ShowMapInteractorInputProtocol?
    var wireFrame: ShowMapWireFrameProtocol?
    
}

extension ShowMapPresenter: ShowMapPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.configureUI()
    }
}

extension ShowMapPresenter: ShowMapInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
