//
//  FilterCollectionViewCell.swift
//  Project6solutions
//
//  Created by Natasha Armbrust on 11/6/17.
//  Copyright © 2017 Natasha Armbrust. All rights reserved.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
    
    var photoImageView: UIImageView!
    var filterLabel: UILabel!
    var unselectedColor: UIColor = .lightGray
    var selectedColor: UIColor = .blue
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        filterLabel = UILabel(frame: bounds)
        filterLabel.textAlignment = .center
        filterLabel.font = .systemFont(ofSize: 14)
        filterLabel.textColor = .blue
        photoImageView = UIImageView(frame: .zero)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        layer.cornerRadius = 5
        backgroundColor = .lightGray
        contentView.addSubview(filterLabel)
        isSelected = false
        contentView.addSubview(photoImageView)
        
        
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 15).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
        photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor ).isActive = true
        
        
    }
    
    
    func setup(with title: String) {
        photoImageView.image = UIImage(named: title)
        photoImageView.alpha = 0.8
        filterLabel.text = title
    }
    
    //when a cell is selected, we change the background / text color here to reflect the selected
    override var isSelected: Bool {
        didSet {
            super.isSelected = isSelected
            if isSelected {
                backgroundColor = selectedColor
                filterLabel.textColor = unselectedColor
            } else {
                backgroundColor = unselectedColor
                filterLabel.textColor = selectedColor
            }
            setNeedsDisplay()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

