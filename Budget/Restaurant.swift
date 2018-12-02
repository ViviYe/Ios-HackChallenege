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
    case Home
    case lunch
    case dinner
    
    var filterTitle: String {
        return String(describing: self).localizedUppercase
    }
    
    static func allValues() -> [MealTime] {
        return [.Home,.lunch,.dinner] 
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
    
    init(name: String) {
        self.name = name
        
    }
}
