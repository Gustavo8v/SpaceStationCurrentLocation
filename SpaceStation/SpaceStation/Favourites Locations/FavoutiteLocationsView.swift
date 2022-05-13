//
//  FavoutiteLocationsView.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit

class FavoutiteLocationsView: UIViewController {

    // MARK: Properties
    var presenter: FavoutiteLocationsPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension FavoutiteLocationsView: FavoutiteLocationsViewProtocol {
    // TODO: implement view output methods
}
