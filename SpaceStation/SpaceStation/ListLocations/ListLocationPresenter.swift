//
//  ListLocationPresenter.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation

class ListLocationPresenter  {
    
    // MARK: Properties
    weak var view: ListLocationViewProtocol?
    var interactor: ListLocationInteractorInputProtocol?
    var wireFrame: ListLocationWireFrameProtocol?
    
}

extension ListLocationPresenter: ListLocationPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension ListLocationPresenter: ListLocationInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
