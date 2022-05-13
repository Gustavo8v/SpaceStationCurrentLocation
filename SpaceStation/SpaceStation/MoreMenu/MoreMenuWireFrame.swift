//
//  MoreMenuWireFrame.swift
//  SpaceStation
//
//  Created by Gustavo on 12/05/22.
//  
//

import Foundation
import UIKit

class MoreMenuWireFrame: MoreMenuWireFrameProtocol {
    var view: MoreMenuView
    var presenter: MoreMenuPresenter
    init(){
        self.view = MoreMenuView()
        self.presenter = MoreMenuPresenter()
        view.presenter = self.presenter
        presenter.wireFrame = self
        presenter.view = self.view
    }
    
    func goToListLocationView() {
        let vc = ListLocationWireFrame().view
        view.present(vc, animated: true)
    }
}
