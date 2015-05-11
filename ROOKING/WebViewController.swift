//
//  WebViewController.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 5/6/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
     var coll: NSDictionary?
    
    override func viewDidLoad() {
        
        if let link = coll!["link"]! as? String {
         let url  = NSURL(string: link)
         println(link)
         let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            if error == nil {
                if let urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) {
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.webView.loadHTMLString(urlContent as String, baseURL: url)
                    })
                }
    
            }
            
         })
         task.resume()
        }
        
          
    }
}
