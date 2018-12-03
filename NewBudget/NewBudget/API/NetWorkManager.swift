//
//  NetworkManager.swift
//  L7
//
//  Created by Mindy Lou on 4/11/18.
//  Copyright © 2018 Mindy Lou. All rights reserved.
//
import Foundation
import Alamofire


class NetworkManager {
    
    
     static var userid: Int!
    
    /// Endpoint URL string
    /// NOTE: Remember to set "Allows arbitrary loads" to YES in your Info.plist in order
    /// to access API websites that are not HTTPS (not "secure" - you'll need this for your project)
    private static let endpoint =  "http://35.196.31.92/api/"
   
    static func login(username: String, budget: Int, completion: @escaping (User) -> Void) {
        let parameters: [String:Any] = [
            "username": username,
            "total":budget
        ]
        Alamofire.request(endpoint+"budget/", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let user = try? jsonDecoder.decode(UserDataResponse.self, from: data) {
                  NetworkManager.userid = user.data.id
                    completion(user.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func post(username: String, budget: Int, completion: @escaping (User) -> Void) {
        let parameters: [String:Any] = [
            "username": username,
            "total":budget
        ]
        Alamofire.request(endpoint+"budget/", method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: [:]).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let user = try? jsonDecoder.decode(UserDataResponse.self, from: data) {
                    self.userid = user.data.id
                    completion(user.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
    
}