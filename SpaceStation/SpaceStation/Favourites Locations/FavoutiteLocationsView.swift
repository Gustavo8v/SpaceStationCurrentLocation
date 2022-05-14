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
    
    // MARK: Elements UI
    let tableFavourites = UITableView()
    let withoutLocations = UILabel()

    // MARK: Properties
    var presenter: FavoutiteLocationsPresenterProtocol?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        presenter?.getFavouritesLocations()
    }
}

extension FavoutiteLocationsView: FavoutiteLocationsViewProtocol {
    // TODO: implement view output methods
    
    func configureUI() {
        navigationItem.title = "Ubicaciones guardadas"
        withoutLocations.text = "Al parecer no tienes ubicaciones guardadas\nEn cuanto añadas una a favoritos la podras ver en esta parte"
        withoutLocations.textAlignment = .center
        withoutLocations.numberOfLines = 0
        tableFavourites.delegate = self
        tableFavourites.dataSource = self
        tableFavourites.register(LocationTableViewCell.self, forCellReuseIdentifier: LocationTableViewCell.identifier)
        tableFavourites.translatesAutoresizingMaskIntoConstraints = false
        withoutLocations.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableFavourites)
        view.addSubview(withoutLocations)
        NSLayoutConstraint.activate([
            /// Constrains tableView
            tableFavourites.topAnchor.constraint(equalTo: view.topAnchor),
            tableFavourites.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableFavourites.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableFavourites.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            ///Constrains label
            withoutLocations.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            withoutLocations.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            withoutLocations.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            withoutLocations.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func reloadData() {
        DispatchQueue.main.async {
            self.tableFavourites.reloadData()
            self.withoutLocations.isHidden = self.presenter?.favouritesList?.count == 0 ? false : true
        }
    }
}

extension FavoutiteLocationsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.favouritesList?.count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath) as? LocationTableViewCell else { return UITableViewCell() }
        guard let data = presenter?.favouritesList?[indexPath.row] else { return UITableViewCell() }
        cell.configureCell(data: data)
        cell.delegate = self
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let data = presenter?.favouritesList?[indexPath.row] else { return }
        presenter?.showLocationMap(latitude: data.latitude, longitude: data.longitude)
    }
}

extension FavoutiteLocationsView: LocationTableViewCellDelegate {
    func saveAndDeleteFavourite(selected: LocationModelRealm?) {
        guard let selected = selected else { return }
        presenter?.editList(location: selected)
    }
}
