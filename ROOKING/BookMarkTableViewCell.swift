//
//  BookMarkTableViewCell.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 5/14/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit

class BookMarkTableViewCell: UITableViewCell {

    var coll:BookMark? {
        didSet{
            updateUI()
        }
    }
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    
    
    func updateUI() {

        title.text = coll?.title
        if let imageURL = coll?.image {
            request.getImage(imageURL, callback: {(image) in
                self.imageview.image = image
            })
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

}
