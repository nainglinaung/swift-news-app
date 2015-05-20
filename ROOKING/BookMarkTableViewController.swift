//
//  BookMarkTableViewController.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 5/14/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit
import CoreData


class BookMarkTableViewController: UITableViewController {
    
    let managedObjectContext:NSManagedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext!
    
    var fetchResults = [BookMark]?() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    @IBOutlet weak var mainButton: UIBarButtonItem!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == SEGUE.bookmark {
            println(fetchResults)
            if  let index = tableView.indexPathForSelectedRow() {
                var destination =  segue.destinationViewController as? UIViewController
                if let navCon = destination as? UINavigationController {
                    if let finalController = navCon.visibleViewController as? WebViewController {
                  
                       if let Fetch = fetchResults {
                            let result = Fetch[index.row]
                            let dict = result.outputAsDictionary()
                            finalController.coll = dict
                       }
                    }
                }
            }
        }
    }
    
    @IBAction func clear(sender: UIBarButtonItem) {

        if let fetch = fetchResults {
            for result in fetch {
                managedObjectContext.deleteObject(result)
                managedObjectContext.save(nil)
            }
        }
        fetchResults = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest = NSFetchRequest(entityName: "Bookmark")
        fetchResults = (managedObjectContext.executeFetchRequest(fetchRequest, error: nil) as? [BookMark])!
        
        if self.revealViewController() != nil {
            mainButton.target = self.revealViewController()
            mainButton.action = "revealToggle:"
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResults!.count ?? 0
    }

  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier, forIndexPath: indexPath) as! BookMarkTableViewCell
        
        if let fetch = fetchResults {
            cell.coll = fetch[indexPath.row] as BookMark
        }
        
        return cell
    }
  
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
