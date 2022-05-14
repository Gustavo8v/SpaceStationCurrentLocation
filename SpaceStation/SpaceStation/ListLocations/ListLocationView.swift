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
    var closeButton = UIButton()

    // MARK: Properties
    var presenter: ListLocationPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @objc func closeView(){
        dismiss(animated: true)
    }
}

extension ListLocationView: ListLocationViewProtocol {
    // TODO: implement view output methods
    func configureUI() {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        view.backgroundColor = .white
        // Configure Map
        mapView.roundCorners(corners: [.bottomLeft, .bottomRight], radius: 18)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure Table
        listLocations.delegate = self
        listLocations.dataSource = self
        listLocations.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.identifier)
        listLocations.translatesAutoresizingMaskIntoConstraints = false
        
        // Configure close button
        closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        closeButton.setImage(UIImage(systemName: "multiply"), for: .normal)
        closeButton.backgroundColor = .white
        closeButton.tintColor = .black
        closeButton.layer.cornerRadius = closeButton.bounds.width / 2
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mapView)
        view.addSubview(listLocations)
        view.addSubview(closeButton)
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
            listLocations.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            //Constrains Button
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
    }
    
    func reloadTable() {
        listLocations.reloadData()
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
        cell.delegate = self
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

extension ListLocationView: LocationTableViewCellDelegate {
    func saveAndDeleteFavourite(selected: LocationModelRealm?) {
        guard let selected = selected else { return }
        presenter?.markFavourite(object: selected)
    }
}
