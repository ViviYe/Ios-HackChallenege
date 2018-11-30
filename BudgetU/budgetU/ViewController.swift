//
//  ViewController.swift
//  yy453_p3
//
//  Created by 无比机智的树懒大人 on 10/20/18.
//  Copyright © 2018 无比机智的树懒大人. All rights reserved.
//

import UIKit


protocol ChangeButtonTitleDelegate: class {
    func buttonTitleChanged(newTitle: String)
    func buttonTitleChanged2(newTitle: String)
}

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    
    var itemArray: [Dashboard]!
    
    
    
    let HomeViewcellid = "HomeViewIdentifier"
    let headerReuseIdentifier = "headerReuseIdentifier"
    let padding: CGFloat = 8
    let headerHeight: CGFloat = 30
    
    
    
    
    var pushNavViewControllerButton: UIButton!
    var presentModalViewControllerButton: UIButton!
    
    override func viewDidLoad() {
        
       
        
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        
       
        
        // Set the navigation controller's title
        title = "Budget!"
        
        
        
        let  hm = Dashboard(imageName: "Home")
        itemArray = [hm]
       
        pushNavViewControllerButton = UIButton()
        
        pushNavViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        pushNavViewControllerButton.setTitle("add spending", for: .normal)
        pushNavViewControllerButton.setTitleColor(.black, for: .normal)
        pushNavViewControllerButton.addTarget(self, action: #selector(pushNavViewController), for: .touchUpInside)
        view.addSubview(pushNavViewControllerButton)
        
        presentModalViewControllerButton = UIButton()
        presentModalViewControllerButton.translatesAutoresizingMaskIntoConstraints = false
        presentModalViewControllerButton.setTitle("view spending", for: .normal)
        presentModalViewControllerButton.setTitleColor(.black, for: .normal)
        presentModalViewControllerButton.addTarget(self, action: #selector(pushNavViewController2), for: .touchUpInside)
        view.addSubview(presentModalViewControllerButton)
   
        
        let layout = UICollectionViewFlowLayout()
        // scrollDirection can be vertical or horizontal
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = padding
        layout.minimumLineSpacing = padding
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            pushNavViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pushNavViewControllerButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pushNavViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])
        
        NSLayoutConstraint.activate([
            presentModalViewControllerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentModalViewControllerButton.topAnchor.constraint(equalTo: pushNavViewControllerButton.bottomAnchor, constant: 16),
            presentModalViewControllerButton.heightAnchor.constraint(equalToConstant: 24)
            ])
        
       
        
        
        
        
    }
    
    @objc func pushNavViewController() {
        let navViewController = Addcontroller()
        
       // navViewController.delegate = self
        navigationController?.pushViewController(navViewController, animated: true)
    }
    
    @objc func pushNavViewController2()  {
        let navViewController = ViewSpendingController()
        
        //navViewController.delegate = self
        navigationController?.pushViewController(navViewController, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeViewcellid, for: indexPath) as! HomeView
        let item = itemArray[indexPath.item]
        cell.configure(for: item)
        cell.setNeedsUpdateConstraints()
        
        return cell
        
        
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return itemArray.count
        
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
}


extension ViewController: ChangeButtonTitleDelegate {
    func buttonTitleChanged(newTitle: String) {
        presentModalViewControllerButton.setTitle(newTitle, for: .normal)
    }
    func buttonTitleChanged2(newTitle: String) {
        pushNavViewControllerButton.setTitle(newTitle, for: .normal)
    }
}
