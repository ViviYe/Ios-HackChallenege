//
//  RestaurantCollectionViewCell.swift
//  Project6solutions
//
//  Created by Natasha Armbrust on 11/6/17.
//  Copyright © 2017 Natasha Armbrust. All rights reserved.
//

import UIKit

class CatagoryCollectionViewCell: UICollectionViewCell {
    var photoImageView: UIImageView!
    var filterLabel: UILabel!
    
    var nameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = .systemFont(ofSize: 16)
        nameLabel.numberOfLines = 2
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        
        photoImageView = UIImageView(frame: .zero)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        photoImageView.contentMode = .scaleAspectFit
        
        
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        
    }
    
    
    
    
    func setup(withCatagories cata: Catagories) {
        photoImageView.image = UIImage(named: cata.name)
        photoImageView.alpha = 0.8
        nameLabel.text = cata.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
