//
//  GalleryViewController.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 4/29/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UITabBarDelegate{

    
    func tabBar(tabBar: UITabBar, didSelectItem item: UITabBarItem!) {
        // println(item.tag)
        if item.tag == 1 {
            revealViewController().revealToggle(self)
        }
    }
    
    @IBOutlet weak var Home: UITabBarItem!
    @IBOutlet weak var mainButton: UIButton!
    
    var galleryArray:NSArray = []
    var request = Request()
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return galleryArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier, forIndexPath: indexPath) as! GalleryTableViewCell
        if let data = galleryArray[indexPath.row] as? NSDictionary {
            cell.coll = data
        }
        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        galleryArray = request.send(URL.gallery)!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
