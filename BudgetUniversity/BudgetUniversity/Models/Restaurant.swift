//
//  Restaurant.swift
//  Project6solutions
//
//  Created by Natasha Armbrust on 11/6/17.
//  Copyright © 2017 Natasha Armbrust. All rights reserved.
//

import UIKit

protocol Filter {
    var filterTitle: String { get }
}

enum CuisineType: Filter {
    case american
    case mexican
    case italian
    case french
    case japanese
    case chinese
    case greek
    
    var filterTitle: String { //return the enum title with first letter uppercased
        return String(describing: self).localizedUppercase
    }
    
    static func allValues() -> [CuisineType] {
        return [.american,.mexican,.italian,.french,.japanese,.chinese,.greek]
    }
}

enum MealTime: Filter {
    case breakfast
    case lunch
    case dinner
    
    var filterTitle: String {
        return String(describing: self).localizedUppercase
    }
    
    static func allValues() -> [MealTime] {
        return [.breakfast,.lunch,.dinner]
    }
}

enum Cost: Filter {
    case cheap
    case moderate
    case expensive
    
    var filterTitle: String {
        return String(describing: self).localizedUppercase
    }
    
    static func allValues() -> [Cost] {
        return [.cheap,.moderate,.expensive]
    }
}

class Restaurant: NSObject {
    let name: String
    let cuisineTypes: [CuisineType]
    let mealTimes: [MealTime]
    let cost: Cost //only can have one type of cost
    
    init(name: String, cuisineTypes:  [CuisineType], mealTimes: [MealTime], cost: Cost) {
        self.name = name
        self.cuisineTypes = cuisineTypes
        self.mealTimes = mealTimes
        self.cost = cost
    }
}
