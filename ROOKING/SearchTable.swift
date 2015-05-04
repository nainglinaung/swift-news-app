//
//  SearchTable.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 5/4/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class SearchTable: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    
    var coll: NSDictionary? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
           var data: AnyObject = coll!["title"]!
           titleLabel.text = "\(data)"
    }
    
}
