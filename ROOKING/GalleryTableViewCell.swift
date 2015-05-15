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
    
    var imageCache = [String:UIImage]()
   
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var imageThree: UIImageView!
    @IBOutlet weak var imageTwo: UIImageView!
    @IBOutlet weak var imageOne: UIImageView!
    
    func updateUI() {
    
    
        var collectionTitle = coll!["title"]! as! String
        var collectionImagePath = coll!["images"]! as! [String]
        
        title.text = collectionTitle
        
        imageOne.image = UIImage(named: "one.png")
        imageTwo.image = UIImage(named: "one.png")
        imageThree.image = UIImage(named: "one.png")
        
        
        request.getImage(collectionImagePath[0], callback: {(image) in
            self.imageOne.image = image
        })
        
        request.getImage(collectionImagePath[1], callback: {(image) in
            self.imageTwo.image = image
        })
        
        request.getImage(collectionImagePath[2], callback: {(image) in
            self.imageThree.image = image
        })        
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
