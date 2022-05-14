//
//  ShowMapView.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//  
//

import Foundation
import UIKit
import MapKit

class ShowMapView: UIViewController {
    
    // MARK: Elements UI
    let map = MKMapView()
    var closeButton = UIButton()

    // MARK: Properties
    var presenter: ShowMapPresenterProtocol?
    var location: CLLocation?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @objc func closeView(){
        dismiss(animated: true)
    }
}

extension ShowMapView: ShowMapViewProtocol {
    // TODO: implement view output methods
    func configureUI() {
        // Configure close button
        closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        closeButton.setImage(UIImage(systemName: "multiply"), for: .normal)
        closeButton.backgroundColor = .white
        closeButton.tintColor = .black
        closeButton.layer.cornerRadius = closeButton.bounds.width / 2
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        
        map.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(map)
        view.addSubview(closeButton)
        NSLayoutConstraint.activate([
            // Constrains map
            map.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            map.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            map.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            map.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            //Constrains para close button
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
        guard let location = location else { return }
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: Double(location.coordinate.latitude),
                                                       longitude: Double(location.coordinate.longitude))
        self.map.addAnnotation(annotation)
        map.centerToLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
}
