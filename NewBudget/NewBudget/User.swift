//
//  User.swift
//  NewBudget
//
//  Created by 无比机智的树懒大人 on 12/2/18.
//  Copyright © 2018 无比机智的树懒大人. All rights reserved.
//
import Foundation

// The response we get contains a key for data, so the CourseResponse object
// contains a variable called data. Each one of these structs must conform
// to codable in order to be decoded from JSON.


// The data key maps to this CourseDataResponse type. In here, there's a
// JSON that maps "classes" to an array of courses.
struct UserDataResponse: Codable {
    var data: User
}

// Each course has a name, code, instructor, and enrollment information.
struct User: Codable {
    var id: Int
    var total: Int
    var spent: Int
    var username: String
}
