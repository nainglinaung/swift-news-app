//
//  WebViewController.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 5/6/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit
import CoreData


class WebViewController: UIViewController{

    @IBOutlet weak var webView: UIWebView!
    var coll: NSDictionary?
    var content:NSString?
    
    let managedObjectContext:NSManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    
    func insertData(data:NSMutableDictionary) -> Void {
        if let BookmarkEntry = NSEntityDescription.insertNewObjectForEntityForName("Bookmark", inManagedObjectContext: managedObjectContext) as? BookMark {
            if let result = coll {
                BookmarkEntry.save(result)
                managedObjectContext.save(nil)
            }
        }
    }
    
    @IBAction func back(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func Bookmark(sender: UIBarButtonItem) {
        if var data = coll as? NSMutableDictionary {
            data["data"] = content
            insertData(data)
        }
    }
    
  
    override func viewDidLoad() {
        
        if let collection = coll {
            if let link = collection["link"] as? String {
                fetchURL(link)
            }
        } else {
            print(coll)
        }
    }
    
    func fetchURL(link:String) {
        let url  = NSURL(string: link)
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!, completionHandler: { (data, response, error) -> Void in
            if error == nil {
                if let urlContent = NSString(data: data, encoding: NSUTF8StringEncoding) {
                    self.content = urlContent
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.webView.loadHTMLString(urlContent as String, baseURL: url)
                    })
                }
            }
        })
        task.resume()
    }
    
}
