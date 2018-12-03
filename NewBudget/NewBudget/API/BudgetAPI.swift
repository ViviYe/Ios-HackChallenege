//
//  RestAPI.swift
//  Project6solutions
//
//  Created by Natasha Armbrust on 11/6/17.
//  Copyright © 2017 Natasha Armbrust. All rights reserved.
//

import Foundation

class BudgetAPI {
    
    static func getCatagories() -> [Catagories] {
        let cata = [
            Catagories(name: "Food"),
            Catagories(name: "Hobby"),
            Catagories(name: "Study"),
            Catagories(name: "Grocery"),
            Catagories(name: "Income"),
            Catagories(name: "Fun activities"),
            Catagories(name: "Laundry"),
            Catagories(name: "Other")
        ]
        return cata
    }
    
    
    
    
   
    
    
    
    static func getfoodspending() -> [Spending] {
        let spt = [
            Spending(name: "lunch", amount: 20),
            Spending(name: "milktea", amount: 20)
        ]
        
        return spt
    }
    
    
}
