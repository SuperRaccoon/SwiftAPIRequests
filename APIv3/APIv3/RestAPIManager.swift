//
//  RestAPIManager.swift
//  myAPI
//
//  Created by Honza on 25/06/15.
//  Copyright (c) 2015 Zekun. All rights reserved.
//

import Foundation

typealias ServiceResponse = (JSON, NSError?) -> Void

class RestAPIManager: NSObject {
    static let sharedInstance = RestAPIManager()
    
    let baseURL = "http://api.randomuser.me"
    
    func getRandomUser(onCompletion: (JSON) -> Void) {
        
    }
    
    
    func makeHTTPGetRequest(path:String, onCompletion: ServiceResponse){
        let request = NSMutableURLRequest(URL: NSURL(string:path)!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error in let json: JSON = JSON(data)
            
            onCompletion(json, error)
        })
        
        task.resume()
    }
}
