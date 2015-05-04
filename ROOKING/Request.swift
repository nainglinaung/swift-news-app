//
//  Request.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 5/4/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import Foundation


public class Request {
        
    func send(urlString:String) -> NSArray?{
        if let url = NSURL(string: urlString) {
            if let data = NSData(contentsOfURL: url) {
                let lists = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error:nil) as! NSArray
                return lists
            }
        }
        return nil
    }

}