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
    
    @IBOutlet weak var featuredImage: UIImageView!
    
    var coll: NSDictionary? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        var urlString = coll!["image"]! as! String
        
        if let collection = coll {
            if let data = collection["title"] as? String {
                titleLabel.text = data
            }
            if let urlString = collection["image"] as? String {
                request.getImage(urlString, callback: {(image) in
                    self.featuredImage.image = image
                })
            }
        }
    }
    
}
