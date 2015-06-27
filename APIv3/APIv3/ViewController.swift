//
//  ViewController.swift
//  APIv3
//
//  Created by Honza on 25/06/15.
//  Copyright (c) 2015 Zekun. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var labelThing: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.labelThing.text = "wewe"
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var postEndpoint: String = "http://api.openweathermap.org/data/2.5/weather?zip=94040,us"
        var urlRequest = NSURLRequest(URL: NSURL(string: postEndpoint)!)
        
        
        self.labelThing.text = "wewe1"
        
        
        
        NSURLConnection.sendAsynchronousRequest(urlRequest, queue: NSOperationQueue(), completionHandler:{
            (response:NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            if let anError = error
            {
                self.labelThing.text = "wewe12"
                
                // got an error in getting the data, need to handle it
                println("error calling GET on /posts/1")
                
                
                self.labelThing.text = "wewe2"
            }
            else // no error returned by URL request
            {
                // parse the result as json, since that's what the API provides
                var jsonError: NSError?
                let post = NSJSONSerialization.JSONObjectWithData(data, options: nil, error: &jsonError) as! NSDictionary
                if let aJSONError = jsonError
                {
                    // got an error while parsing the data, need to handle it
                    println("error parsing /posts/1")
                    
                    self.labelThing.text = "wewe3"
                }
                else
                {
                    // now we have the post, let's just print it to prove we can access it
                    
                    
                    // the post object is a dictionary
                    // so we just access the title using the "title" key
                    // so check for a title and print it if we have one
                    if var postTitle = post["name"] as? String
                    {
                        //println("The name is: " + postTitle)
                        
                        self.labelThing.text = "wewe4"
                        
                        
                        
                        self.labelThing.text = postTitle
                    }
                }
            }
        })
        
        
        
        
        
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

