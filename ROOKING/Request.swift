//
//  Request.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 5/4/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import Foundation




public class Request {
    
    var imageCache = [String:UIImage]()
        
    func send(urlString:String) -> NSArray?{
        if let url = NSURL(string: urlString) {
            if let data = NSData(contentsOfURL: url) {
                let lists = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error:nil) as! NSArray
                return lists
            }
        }
        return nil
    }
    
    func getImage(urlString:String,callback: UIImage? -> Void) {
        
        if let image = imageCache[urlString] {
            callback(image)
        } else {
            let imageURL = NSURL(string: urlString)
            let request = NSURLRequest(URL: imageURL!)
            let mainQueue = NSOperationQueue.mainQueue()
            
            NSURLConnection.sendAsynchronousRequest(request, queue: mainQueue, completionHandler: { (response, data, error) -> Void in
                if error == nil {
                    let image = UIImage(data: data)
                    self.imageCache[urlString] = image
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        callback(image)
                    })
                }
            })
            callback(nil)
        }
       
    }

}