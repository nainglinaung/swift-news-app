//
//  MainTableViewCell.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 4/27/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit




class MainTableViewCell: UITableViewCell {


    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var featured: UIImageView!
    
    
    var coll: NSDictionary? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func updateUI() {
        var data = coll!["title"]! as! String
        var urlString = coll!["image"]! as! String
        
        title.text = data
        featured.image = UIImage(named: "one.png")
        
        request.getImage(urlString, callback: {(image) in
           self.featured.image = image
        })
        
        
        
        
    }

}
