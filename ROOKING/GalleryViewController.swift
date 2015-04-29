//
//  GalleryViewController.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 4/29/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    
    @IBOutlet weak var mainButton: UIButton!
    var galleryArray:NSArray = []
    
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
        if self.revealViewController() != nil {
            mainButton.addTarget(self.revealViewController(), action: "revealToggle:", forControlEvents: .TouchUpInside)
        }
        
        if let url = NSURL(string: URL.main) {
            if let data = NSData(contentsOfURL: url) {
                galleryArray =  NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error:nil) as! NSArray
                println("Hi")
            }
        }
        
        // Do any additional setup after loading the view.
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
