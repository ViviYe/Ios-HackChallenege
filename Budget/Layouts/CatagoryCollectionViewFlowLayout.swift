//
//  DisplayRestaurantsCollectionViewFlowLayout.swift
//  Project6solutions
//
//  Created by Natasha Armbrust on 11/6/17.
//  Copyright © 2017 Natasha Armbrust. All rights reserved.
//

import UIKit

class CatagoryCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    let cellWidth: CGFloat = 180
    let cellHeight: CGFloat = 180
    
    override func prepare() {
        super.prepare()
        let edgeInset = (UIScreen.main.bounds.width - 2 * cellWidth) / 5
        itemSize = CGSize(width: cellWidth, height: cellHeight)
        minimumLineSpacing = edgeInset
        minimumInteritemSpacing = edgeInset
        sectionInset = UIEdgeInsets(top: edgeInset, left: edgeInset, bottom: edgeInset, right: edgeInset)
    }
}
