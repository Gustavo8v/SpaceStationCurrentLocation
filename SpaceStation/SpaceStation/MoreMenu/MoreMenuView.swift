//
//  MoreMenuView.swift
//  SpaceStation
//
//  Created by Gustavo on 12/05/22.
//  
//
protocol MoreMenuViewDelegate: AnyObject {
    func updateLocation()
    func deleteAllRegisters()
}

import Foundation
import UIKit

class MoreMenuView: UIViewController {
    
    // MARK: Elements UI
    let moreTable = UITableView()
    let contentView = UIView()
    var closeButton = UIButton()

    // MARK: Properties
    var presenter: MoreMenuPresenterProtocol?
    weak var delegate: MoreMenuViewDelegate?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @objc func closeView(){
        dismiss(animated: true)
    }
}

extension MoreMenuView: MoreMenuViewProtocol {
    // TODO: implement view output methods
    func configureUI() {
        // Configure content View
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.roundCorners(corners: [.topLeft, .bottomLeft], radius: 16)
        contentView.backgroundColor = .white
        
        // Configure close button
        closeButton = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        closeButton.setImage(UIImage(systemName: "multiply"), for: .normal)
        closeButton.backgroundColor = .white
        closeButton.tintColor = .black
        closeButton.layer.cornerRadius = closeButton.bounds.width / 2
        closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        
        // Configure Table
        moreTable.delegate = self
        moreTable.dataSource = self
        moreTable.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        // add Views
        contentView.translatesAutoresizingMaskIntoConstraints = false
        moreTable.translatesAutoresizingMaskIntoConstraints = false
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurEffectView)
        view.addSubview(contentView)
        view.addSubview(closeButton)
        contentView.addSubview(moreTable)
        NSLayoutConstraint.activate([
            //Constrains para el view contenedor
            contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            contentView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2),
            
            //Constrains para la tabla
            moreTable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            moreTable.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            moreTable.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            moreTable.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            //Constrains para close button
            closeButton.widthAnchor.constraint(equalToConstant: 40),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
        ])
    }
}

extension MoreMenuView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.prepareOptionsMoreMenu().count ?? .zero
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.font = cell.textLabel?.font.withSize(12)
        cell.textLabel!.text = presenter?.prepareOptionsMoreMenu()[indexPath.row]
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let switchRows = SectionsTableMenu(rawValue: indexPath.row) else { return }
        switch switchRows {
        case .history:
            presenter?.goToHistory()
        case .deleteHistory:
            dismiss(animated: true) {
                self.delegate?.deleteAllRegisters()
            }
        case .favourites:
            print("favourires")
        case .updateLocation:
            dismiss(animated: true) {
                self.delegate?.updateLocation()
            }
        case .close:
            closeView()
        }
    }
}
