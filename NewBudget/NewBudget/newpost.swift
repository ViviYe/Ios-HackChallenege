//
//  newpost.swift
//  NewBudget
//
//  Created by 无比机智的树懒大人 on 12/3/18.
//  Copyright © 2018 无比机智的树懒大人. All rights reserved.
//

import Foundation

// The response we get contains a key for data, so the CourseResponse object
// contains a variable called data. Each one of these structs must conform
// to codable in order to be decoded from JSON.


// The data key maps to this CourseDataResponse type. In here, there's a
// JSON that maps "classes" to an array of courses.
struct postresDataResponse: Codable {
    var data: postresresponse
}

// Each course has a name, code, instructor, and enrollment information.
struct postresresponse: Codable {
    var id: Int
    var name: Int
    var total: Int
  
}
