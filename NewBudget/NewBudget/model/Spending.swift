//
//  Spending.swift
//  BudgetUniversity
//
//  Created by 无比机智的树懒大人 on 11/29/18.
//  Copyright © 2018 无比机智的树懒大人. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Spending: Codable {
    let name: String
    var amount: Int
    
    init(name: String, amount: Int) {
        self.name = name
        self.amount = amount
    
    }
}

 
struct spendingResponse: Codable {
    var data: spendingDataResponse
}

struct spendingDataResponse: Codable {
    var spend: [Spending]
}


