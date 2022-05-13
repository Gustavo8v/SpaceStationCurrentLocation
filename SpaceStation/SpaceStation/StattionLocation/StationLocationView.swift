//
//  StationLocationView.swift
//  SpaceStation
//
//  Created by Gustavo on 11/05/22.
//  
//

import UIKit
import MapKit

class StationLocationView: UIViewController {
    
    // MARK: Elements UI
    
    let map = MKMapView()
    var moreButton = UIButton()

    // MARK: Properties
    var presenter: StationLocationPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        presenter?.getLocationStation()
    }
    
    @objc func showOptionsMaps(){
        presenter?.goMoreMenu()
    }
}

extension StationLocationView: StationLocationViewProtocol {
    // TODO: implement view output methods
    func configureUI() {
        map.delegate = self
        moreButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        moreButton.setImage(UIImage(systemName: "line.3.horizontal"), for: .normal)
        moreButton.backgroundColor = .white
        moreButton.tintColor = .black
        moreButton.layer.cornerRadius = moreButton.bounds.width / 2
        moreButton.addTarget(self, action: #selector(showOptionsMaps), for: .touchUpInside)
        map.translatesAutoresizingMaskIntoConstraints = false
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(map)
        view.addSubview(moreButton)
        NSLayoutConstraint.activate([
            // Constrains Map
            map.topAnchor.constraint(equalTo: view.topAnchor),
            map.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            map.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            map.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //Constrains Button
            moreButton.widthAnchor.constraint(equalToConstant: 40),
            moreButton.heightAnchor.constraint(equalToConstant: 40),
            moreButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            moreButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
        ])
    }
    
    func setLoactionInMap(latitude: Double, longitude: Double, pin: MKPointAnnotation) {
        DispatchQueue.main.async {
            self.map.deleteAllPins()
            self.map.centerToLocation(latitude: latitude, longitude: longitude)
            self.map.addAnnotation(pin)
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                self.presenter?.getLocationStation()
            }
        }
    }
}

extension StationLocationView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        let annotationIdentifier = "AnnotationIdentifier"
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }

        if let annotationView = annotationView {
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "ISSIcon")
        }
        return annotationView
    }
}

extension StationLocationView: MoreMenuViewDelegate {
    
    func updateLocation() {
        presenter?.getLocationStation()
    }
    
    func deleteAllRegisters() {
        presenter?.deleteAllRegisters()
    }
}
