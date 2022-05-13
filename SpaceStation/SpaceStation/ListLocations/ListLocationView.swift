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
        presenter?.viewDidLoad()
    }
}

extension ListLocationView: ListLocationViewProtocol {
    // TODO: implement view output methods
    func configureUI() {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        // Configure Map
        mapView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 18)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure Table
        listLocations.delegate = self
        listLocations.dataSource = self
        listLocations.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.identifier)
        listLocations.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mapView)
        view.addSubview(listLocations)
        NSLayoutConstraint.activate([
            // Constrains MapView
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.widthAnchor.constraint(equalToConstant: width),
            mapView.heightAnchor.constraint(equalToConstant: height / 2),
            mapView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Constrains TableView
            listLocations.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            listLocations.widthAnchor.constraint(equalToConstant: width),
            listLocations.heightAnchor.constraint(equalToConstant: height / 2),
            listLocations.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension ListLocationView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getDataBaseLocations().count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as? LocationTableViewCell else { return UITableViewCell() }
        guard let data = presenter?.getDataBaseLocations()[indexPath.row] else { return UITableViewCell() }
        cell.configureCell(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mapView.deleteAllPins()
        guard let data = presenter?.getDataBaseLocations()[indexPath.row] else { return }
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: Double(data.latitude) ?? .zero,
                                                       longitude: Double(data.latitude) ?? .zero)
        self.mapView.addAnnotation(annotation)
        mapView.centerToLocation(latitude: Double(data.latitude) ?? .zero, longitude: Double(data.latitude) ?? .zero)
    }
}
