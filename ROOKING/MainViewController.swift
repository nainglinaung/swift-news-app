//
//  MainViewController.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 4/22/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    
    
    @IBOutlet var lorem: UIButton!
    
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
         self.navigationController?.navigationBarHidden = true
        
        if self.revealViewController() != nil {
          lorem.addTarget(self.revealViewController(), action: "revealToggle:", forControlEvents: .TouchUpInside)
            //  mainButton.target = self.revealViewController()
            //  mainButton.action = "revealToggle:"
            
         
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
