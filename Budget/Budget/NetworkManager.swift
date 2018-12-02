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

	/// Endpoint URL string
	/// NOTE: Remember to set "Allows arbitrary loads" to YES in your Info.plist in order
	/// to access API websites that are not HTTPS (not "secure" - you'll need this for your project)
	private static let endpoint = "http://35.196.31.92/"
	private static let postuser = "http://35.196.31.92/budget"
	private static let dogEndpoint = "https://random.dog/woof.json"

	/**
	Gets classes from the endpoint.
	- parameter completion: The completion function to be called once the class JSONs
	are parsed into Class objects.
	What does @escaping mean?
	@escaping means that you can jump out of the function and call the function passed in.
	This function is called after the function returns, or it "escapes" from the function.
	*/
	static func getClasses(completion: @escaping ([Spending]) -> Void) {
        // Here, we make a GET request from the endpoint. This means that we are
        // requesting data. A POST request submits data to the endpoint to be processed.
        // We validate it so that the response code is 200 (OK), so we know we didn't receive
        // a 404 (not found)/request error.
        Alamofire.request(endpoint, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                // If you still want to see the JSON response
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                // Create the JSON decoder
                let jsonDecoder = JSONDecoder()
                // Mention .convertFromSnakeCase
                // jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase

                // Since the format of the data is { "data": { "classes": { [...] } }
                // we need to get inside those two layers of json to decode the classes data
                // into Course objects by first decoding the CourseResponse
                if let courseResponse = try? jsonDecoder.decode(spendingResponse.self, from: data) {
                    // Call the function we passed in to do whatever we want
                    // to the classes array (eg. show it on screen)
                    completion(courseResponse.data.classes)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
	}

//    static func login(email: String, password: String, completion: @escaping (User) -> Void) {
//        let parameters: [String:Any] = [
//            "email": email,
//            "password": password
//        ]
//        Alamofire.request(postEndpoint, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: [:]).validate().responseData { (response) in
//            switch response.result {
//            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
//                    print(json)
//                }
//                let jsonDecoder = JSONDecoder()
//                if let user = try? jsonDecoder.decode(User.self, from: data) {
//                    completion(user)
//                } else {
//                    print("Invalid Response Data")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }


}
