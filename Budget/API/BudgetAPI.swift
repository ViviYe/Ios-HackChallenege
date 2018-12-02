//
//  RestAPI.swift
//  Project6solutions
//
//  Created by Natasha Armbrust on 11/6/17.
//  Copyright © 2017 Natasha Armbrust. All rights reserved.
//

import Foundation

class RestAPI {
    
    static func getCatagories() -> [Catagories] {
        let cata = [
            Catagories(name: "Food"),
           Catagories(name: "Hobby"),
           Catagories(name: "Study"),
            Catagories(name: "Grocery"),
           Catagories(name: "Income"),
           Catagories(name: "Fun activities"),
            Catagories(name: "Laundry")
        ]
        return cata
    }
    
    
    
    
    static func getPage() -> [Page] {
       let pages = [
        Page(name: "Home"),
        Page(name: "dashboard"),
        Page(name: "Profile"),
        ]
        
        return pages
    }
    
    
    
    static func getfoodspending() -> [Spending] {
        let spt = [
            Spending(name: "lunch", amount: 20),
            Spending(name: "milktea", amount: 20)
            ]
        
        return spt
    }
    
    
}
