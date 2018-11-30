//
//  PhotoCollectionViewCell.swift
//  BudgetUniversity
//
//  Created by 无比机智的树懒大人 on 11/28/18.
//  Copyright © 2018 无比机智的树懒大人. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    var photoImageView: UIImageView!
    var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        photoImageView = UIImageView(frame: .zero)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        
        label = UILabel()
        label.text = "hi"
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentView.addSubview(photoImageView)
        contentView.addSubview(label)
        
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            ])
        super.updateConstraints()
    }
    
    func configure(for res: Catagories) {
        photoImageView.image = UIImage(named: res.profileImageName)
        photoImageView.alpha = 0.8
        label.text = res.profileImageName
        label.backgroundColor = UIColor.white.withAlphaComponent(0.6)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
