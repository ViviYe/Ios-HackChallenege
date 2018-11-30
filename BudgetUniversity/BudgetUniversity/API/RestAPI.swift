//
//  RestAPI.swift
//  Project6solutions
//
//  Created by Natasha Armbrust on 11/6/17.
//  Copyright © 2017 Natasha Armbrust. All rights reserved.
//

import Foundation

class RestAPI {
    
    static func getRestaurants() -> [Restaurant] {
        let restaurants = [
            Restaurant(name: "Chipotle", cuisineTypes: [.mexican], mealTimes: [.lunch,.dinner], cost: .cheap),
            Restaurant(name: "Pokeland", cuisineTypes: [.japanese], mealTimes: [.lunch,.dinner], cost: .cheap),
            Restaurant(name: "CTB", cuisineTypes: [.american], mealTimes: [.breakfast,.lunch,.dinner], cost: .cheap),
            Restaurant(name: "Zaza's", cuisineTypes: [.italian], mealTimes: [.dinner], cost: .expensive),
            Restaurant(name: "Aladdins", cuisineTypes: [.greek], mealTimes: [.dinner], cost: .moderate),
            Restaurant(name: "Carriage House", cuisineTypes: [.american], mealTimes: [.breakfast], cost: .moderate),
            Restaurant(name: "Plum Tree", cuisineTypes: [.japanese], mealTimes: [.lunch,.dinner], cost: .moderate)
        ]
        return restaurants
    }
    
    static func getFilters() -> [Filter] {
        var filters: [Filter] = []
        filters.append(contentsOf: MealTime.allValues().map({ f in f as Filter }))
        filters.append(contentsOf: Cost.allValues().map({ f in f as Filter }))
        filters.append(contentsOf: CuisineType.allValues().map({ f in f as Filter }))
        return filters
    }
}
