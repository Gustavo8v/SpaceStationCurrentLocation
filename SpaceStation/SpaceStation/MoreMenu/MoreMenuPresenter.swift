//
//  MoreMenuPresenter.swift
//  SpaceStation
//
//  Created by Gustavo on 12/05/22.
//  
//

import Foundation

class MoreMenuPresenter  {
    
    // MARK: Properties
    weak var view: MoreMenuViewProtocol?
    var wireFrame: MoreMenuWireFrameProtocol?
}

extension MoreMenuPresenter: MoreMenuPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
        view?.configureUI()
    }
    
    func prepareOptionsMoreMenu() -> [String] {
        var optionsArray = [String]()
        optionsArray.append("Actualizar Ubicación")
        optionsArray.append("Historial de ubicaciones")
        optionsArray.append("Eliminar Historial")
        optionsArray.append("Ubicaciones favoritas")
        optionsArray.append("Cerrar menú")
        return optionsArray
    }
    
    func goToHistory() {
        wireFrame?.goToListLocationView()
    }
}

extension MoreMenuPresenter: MoreMenuInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
