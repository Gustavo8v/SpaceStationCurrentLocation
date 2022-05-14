//
//  LocationTableViewCell.swift
//  SpaceStation
//
//  Created by Gustavo on 13/05/22.
//
protocol LocationTableViewCellDelegate: AnyObject {
    func saveAndDeleteFavourite(selected: LocationModelRealm?)
}

import UIKit

class LocationTableViewCell: UITableViewCell {
    
    let location = UILabel()
    let date = UILabel()
    let markFavourite = UIButton()
    var object: LocationModelRealm?
    weak var delegate: LocationTableViewCellDelegate?

    static let identifier = "LocationTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func selectedFavourite(){
        delegate?.saveAndDeleteFavourite(selected: object)
    }
    
    func configureUI(){
        markFavourite.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        markFavourite.addTarget(self, action: #selector(selectedFavourite), for: .touchUpInside)
        location.textAlignment = .left
        date.textAlignment = .left
        location.translatesAutoresizingMaskIntoConstraints = false
        date.translatesAutoresizingMaskIntoConstraints = false
        markFavourite.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(location)
        contentView.addSubview(date)
        contentView.addSubview(markFavourite)
        NSLayoutConstraint.activate([
            markFavourite.heightAnchor.constraint(equalToConstant: 40),
            markFavourite.widthAnchor.constraint(equalToConstant: 40),
            markFavourite.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            markFavourite.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            location.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            location.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            location.trailingAnchor.constraint(equalTo: markFavourite.leadingAnchor, constant: -15),
            date.leadingAnchor.constraint(equalTo: location.leadingAnchor),
            date.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 15),
            date.trailingAnchor.constraint(equalTo: markFavourite.trailingAnchor),
            date.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    func configureCell(data: LocationModelRealm){
        object = data
        location.text = data.location
        date.text = data.date
        markFavourite.tintColor = data.isFavourite ? .red : .gray
    }
}
