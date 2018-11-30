//
//  ViewController.swift
//  L5
//
//  Created by Kevin Chan on 8/25/18.
//  Copyright © 2018 Kevin Chan. All rights reserved.
//

import UIKit

class ViewSpendingController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var collectionView: UICollectionView!
    var refreshControl: UIRefreshControl!
    var personsArray: [Catagories]!
    var personsArraycopy: [Catagories]!
    var empty:[Catagories]!
    
    
    let photoCellReuseIdentifier = "photoCellReuseIdentifier"
    
    let headerReuseIdentifier = "headerReuseIdentifier"
    let padding: CGFloat = 8
    let headerHeight: CGFloat = 30
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Catagoriess"
        view.backgroundColor = .gray
        
        let Food = Catagories(imageName: "Food")
        let Grocery = Catagories(imageName: "Grocery")
        let Travel = Catagories(imageName: "Travel")
        let Shopping = Catagories(imageName: "Shopping" )
        let Laundry = Catagories(imageName: "Laundry")
        let Income = Catagories(imageName: "Income")
        let Study = Catagories(imageName: "Study")
        let Hobby = Catagories(imageName: "Hobby")
        let Medical = Catagories(imageName: "Medical" )
        let Electronics = Catagories(imageName: "Electronics")
        let Transportation = Catagories(imageName: "Transportation")
        let Household = Catagories(imageName: "Household")
        let Investment = Catagories(imageName: "Investment")
        let Funac = Catagories(imageName: "Fun activities")
        let Other = Catagories(imageName: "Other")
        
        
        
        personsArray = [Food, Grocery, Travel,Shopping,Laundry, Income, Study, Hobby, Electronics,Medical, Transportation, Household, Investment, Funac, Other]
        personsArraycopy = [Food, Grocery, Travel,Shopping,Laundry, Income, Study, Hobby, Electronics,Medical, Transportation, Household, Investment, Funac, Other]
        empty = []
        
        
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
        
        // Setup Collection View
        // UICollectionViewFlowLayout is used to help organize our cells/items into a grid-pattern
        
       
        
        
        
        let layout = UICollectionViewFlowLayout()
        // scrollDirection can be vertical or horizontal
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.refreshControl = refreshControl
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: photoCellReuseIdentifier)
        collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        view.addSubview(collectionView)
        setupConstraints()
    }
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
        
        
    }
    
    // MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: photoCellReuseIdentifier, for: indexPath) as! PhotoCollectionViewCell
            let person = personsArray[indexPath.item]
            cell.configure(for: person)
            cell.setNeedsUpdateConstraints()
            
            return cell
            
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
            return personsArray.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath)
            
            headerView.setNeedsUpdateConstraints()
            return headerView
        }
        
    
    
    
    // MARK: - UICollectionViewDelegate (all of these methods are optional)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let navViewController = TableView()
        
        self.navigationController?.pushViewController(navViewController, animated: true)
        collectionView.deselectItem(at: indexPath, animated: true)
        
            //personsArray.remove(at: indexPath.item)
            collectionView.reloadData()
        
        
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
        UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // We want || padding IMAGE padding IMAGE padding IMAGE padding ||
        
            let length = (collectionView.frame.width - padding * 4) / 3.0
            return CGSize(width: length, height: length)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: headerHeight)
    }
    
    // MARK: - Action
    @objc func pulledToRefresh() {
        // Place some code here that fetches new data
        // Then call refreshControl.endRefreshing() once we get that data back
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.refreshControl.endRefreshing()
        }
    }
    
    
    
    
    
}

