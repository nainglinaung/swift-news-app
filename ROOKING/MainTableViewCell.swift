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
    
    
    var coll: NSMutableDictionary? {
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
      
        // Default Image
        featured.image = UIImage(named: "one.png")

        if let collection = coll {
            if let data = collection["title"] as? String {
                title.text = data
            }
            if let urlString = collection["image"] as? String {
                request.getImage(urlString, callback: {(image) in
                    self.featured.image = image
                })
            }
        }
      }

}
