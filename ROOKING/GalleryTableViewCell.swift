//
//  GalleryTableViewCell.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 4/29/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class GalleryTableViewCell: UITableViewCell {

    var coll: NSDictionary? {
        didSet {
            updateUI()
        }
    }
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageOne: UIImageView!
    
    
    func updateUI() {
    
        var data: AnyObject = coll!["title"]!
        println(data)
       title.text = "\(data)"
       imageOne.image = UIImage(named: "one.png")
       imageTwo.image = UIImage(named: "one.png")
       imageThree.image = UIImage(named: "one.png")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
