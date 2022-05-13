//
//  ListLocationView.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit
import MapKit

class ListLocationView: UIViewController {
    
    // MARK: Elements UI
    let mapView = MKMapView()
    let listLocations = UITableView()

    // MARK: Properties
    var presenter: ListLocationPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListLocationView: ListLocationViewProtocol {
    // TODO: implement view output methods
}
