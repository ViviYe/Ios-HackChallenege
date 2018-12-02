//
//  FilterCollectionViewFlowLayout.swift
//  Project6solutions
//
//  Created by Natasha Armbrust on 11/6/17.
//  Copyright © 2017 Natasha Armbrust. All rights reserved.
//

import UIKit

class FilterCollectionViewFlowLayout: UICollectionViewFlowLayout {
    
    var cellWidth: CGFloat = 180
    var cellHeight: CGFloat = 110
    let edgeInset: CGFloat = 9
    let itemHeight: CGFloat = 60
    let itemWidth: CGFloat = 130
    
    override func prepare() {
        super.prepare()
        itemSize = CGSize(width: itemWidth, height: itemHeight)
        minimumLineSpacing = edgeInset
        minimumInteritemSpacing = edgeInset
        scrollDirection = .horizontal
        sectionInset = .zero
    }
}
