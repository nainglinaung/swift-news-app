//
//  MainViewController.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 4/22/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit


public struct Storyboard {
    static let CellReuseIdentifier = "cell"
}

public struct URL {
    static let main = "http://localhost:3000"
    static let gallery = "http://localhost:3000/gallery"
    static let side = "http://localhost:3000/two"
}

var request = Request()

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITabBarDelegate{

    
    var titleArray:NSArray = [] {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
     
        if item.tag == 1 {
            revealViewController().revealToggle(self)
        } else {
            
            if titleArray.count > 0 {
                titleArray = []
                request.send(URL.side, callback:{ (list) in
                    self.titleArray = (list ?? nil)!
                })
            }
        }
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if  let index = tableView.indexPathForSelectedRow() {
                var destination =  segue.destinationViewController as? UIViewController
                if let navCon = destination as? UINavigationController {
                    if let value = navCon.visibleViewController as? WebViewController {
                        value.coll =  titleArray[index.row] as? NSMutableDictionary
                    }
                }
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier, forIndexPath: indexPath) as! MainTableViewCell
        if let data = titleArray[indexPath.row] as? NSMutableDictionary {
            cell.coll = data
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        request.send(URL.side, callback:{ (list) in
            if list != nil {
                println(list)
                self.titleArray = list!
            }
        })
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
