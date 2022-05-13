//
//  FavoutiteLocationsPresenter.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation

class FavoutiteLocationsPresenter  {
    
    // MARK: Properties
    weak var view: FavoutiteLocationsViewProtocol?
    var interactor: FavoutiteLocationsInteractorInputProtocol?
    var wireFrame: FavoutiteLocationsWireFrameProtocol?
    
}

extension FavoutiteLocationsPresenter: FavoutiteLocationsPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension FavoutiteLocationsPresenter: FavoutiteLocationsInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
