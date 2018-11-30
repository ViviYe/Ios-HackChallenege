//
//  ViewController.swift
//  Project6solutions
//
//  Created by Natasha Armbrust on 11/6/17.
//  Copyright © 2017 Natasha Armbrust. All rights reserved.
//

import UIKit

class RestaurantViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    let filterCollectionViewHeight: CGFloat = 100
    let padding: CGFloat = 20
    let filterReuseIdentifier: String = "FilterCollectionViewCell"
    let restaurantReuseIdentifier: String = "RestaurantCollectionViewCell"
    
    var restaurants: [Restaurant] = []
    var activeRestaurants: [Restaurant] = []
    var Pages:[Page] = []
    
    var filters: [Filter] = []
    var activeCostFilter: Set<Cost> = []
    var activeMealTimeFilter: Set<MealTime> = []
    var activeCuisineTypeFilter: Set<CuisineType> = []
    
    var filterCollectionView: UICollectionView!
    var displayRestaurantsCollectionView: UICollectionView!
    var heading : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Budget University"
        edgesForExtendedLayout = [] // gets rid of views going under navigation controller
        
        restaurants = RestAPI.getRestaurants()
        activeRestaurants = restaurants
        filters = RestAPI.getFilters()
        Pages = RestAPI.getPage()
        
        filterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: FilterCollectionViewFlowLayout())
        filterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        filterCollectionView.delegate = self
        filterCollectionView.dataSource = self
        filterCollectionView.register(FilterCollectionViewCell.self, forCellWithReuseIdentifier: filterReuseIdentifier)
        filterCollectionView.showsHorizontalScrollIndicator = false
        filterCollectionView.backgroundColor = .clear
//        filterCollectionView.allowsMultipleSelection = true //this is how we select multiple cells at once
        view.addSubview(filterCollectionView)
        
        displayRestaurantsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: DisplayRestaurantsCollectionViewFlowLayout())
        displayRestaurantsCollectionView.translatesAutoresizingMaskIntoConstraints = false 
        displayRestaurantsCollectionView.dataSource = self
        displayRestaurantsCollectionView.delegate = self
        displayRestaurantsCollectionView.register(RestaurantCollectionViewCell.self, forCellWithReuseIdentifier: restaurantReuseIdentifier)
        displayRestaurantsCollectionView.showsHorizontalScrollIndicator = false
        displayRestaurantsCollectionView.backgroundColor = .clear
        view.addSubview(displayRestaurantsCollectionView)
      
        
        heading = UILabel()
        heading.translatesAutoresizingMaskIntoConstraints = false
        heading.font = UIFont.boldSystemFont(ofSize: 26)
        heading.numberOfLines = 2
        heading.textColor = .black
        heading.textAlignment = .center
        heading.backgroundColor = .lightGray
        heading.text = "Hello, Vivi"
        
        heading.textAlignment = .center
        view.addSubview(heading)
        

        setupConstraints()
    }

    func setupConstraints() {
        
        
        heading.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        heading.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        heading.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        heading.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        heading.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        displayRestaurantsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        displayRestaurantsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        displayRestaurantsCollectionView.topAnchor.constraint(equalTo: heading.bottomAnchor).isActive = true
        displayRestaurantsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -filterCollectionViewHeight-30).isActive = true
        displayRestaurantsCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
        filterCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        filterCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        filterCollectionView.topAnchor.constraint(equalTo: displayRestaurantsCollectionView.bottomAnchor).isActive = true
        filterCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        filterCollectionView.heightAnchor.constraint(equalToConstant: filterCollectionViewHeight).isActive = true

    }
    
    //MARK:
    //MARK: CollectionView Delegates / Datasources
    //MARK:
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == filterCollectionView {
            return Pages.count
        } else {
            return activeRestaurants.count
        }
    }
    
    //add filter
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == filterCollectionView {
           
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as? FilterCollectionViewCell else { return }
//            let currentFilter = filters[indexPath.item]
//            changeFilter(filter: currentFilter, shouldRemove: false)
            //            displayRestaurantsCollectionView.reloadData() let navViewController = ViewSpendingController()
            
            //navViewController.delegate = self
            
        }else {
            let navViewController = catagorydetail()
            navigationController?.pushViewController(navViewController, animated: true)
        }
    }
    
    //remove filter
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        if collectionView == filterCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as? FilterCollectionViewCell else { return }
            let currentFilter = filters[indexPath.item]
            changeFilter(filter: currentFilter, shouldRemove: true)
            displayRestaurantsCollectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == filterCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: filterReuseIdentifier, for: indexPath) as? FilterCollectionViewCell else { return UICollectionViewCell() }
            let page = Pages[indexPath.item]
            
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.borderWidth = 10
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
            cell.contentView.layer.masksToBounds = true
            cell.setup(with: page.name)
           
           
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: restaurantReuseIdentifier, for: indexPath) as? RestaurantCollectionViewCell else { return UICollectionViewCell() }
            let restaurant = activeRestaurants[indexPath.item]
            cell.contentView.layer.cornerRadius = 10
            cell.contentView.layer.borderWidth = 10
            cell.contentView.layer.borderColor = UIColor.clear.cgColor
           // cell.contentView.layer.masksToBounds = true
            cell.setup(withRestaurant: restaurant)
            
            return cell
        }
    }
    
    //MARK:
    //MARK: Filter functionality
    //MARK:
    
    //inserts or removes a filter into the acitveFilters then filters the restaurants accordingly
    func changeFilter(filter: Filter, shouldRemove: Bool = false) {
        if let cuisineType = filter as? CuisineType {
            if shouldRemove {
              activeCuisineTypeFilter.remove(cuisineType)
            } else {
                activeCuisineTypeFilter.insert(cuisineType)
            }
        }
        if let mealTime = filter as? MealTime {
            if shouldRemove {
                activeMealTimeFilter.remove(mealTime)
            } else {
               activeMealTimeFilter.insert(mealTime)
            }
        }
        if let cost = filter as? Cost {
            if shouldRemove {
                activeCostFilter.remove(cost)
            } else {
                activeCostFilter.insert(cost)
            }
        }
        filterRestaurants() //now filter the restaurants according to our activeFilters 
    }
    
    func filterRestaurants() {
//        if activeMealTimeFilter.count == 0 && activeCostFilter.count == 0 && activeCuisineTypeFilter.count == 0 {
//            activeRestaurants = restaurants
//            return
//        }
//        activeRestaurants = restaurants.filter({ r in
//            var mealTimeFilteredOut = activeMealTimeFilter.count > 0
//            if activeMealTimeFilter.count > 0 {
//                for mealTime in r.mealTimes {
//                    if activeMealTimeFilter.contains(mealTime) {
//                        mealTimeFilteredOut = false
//                    }
//                }
//            }
//
//            var costFilteredOut = activeCostFilter.count > 0
//            if activeCostFilter.count > 0 {
//                if activeCostFilter.contains(r.cost) {
//                    costFilteredOut = false
//                }
//            }
//
//            var cuisineTypeFilteredOut = activeCuisineTypeFilter.count > 0
//            if activeCuisineTypeFilter.count > 0 {
//                for cuisineType in r.cuisineTypes {
//                    if activeCuisineTypeFilter.contains(cuisineType) {
//                        cuisineTypeFilteredOut = false
//                    }
//                }
//            }
//            return !(cuisineTypeFilteredOut || costFilteredOut || mealTimeFilteredOut)
//        })
    }
}

