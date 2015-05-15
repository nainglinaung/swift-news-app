//
//  BookMark.swift
//  ROOKING
//
//  Created by Naing Lin Aung on 5/14/15.
//  Copyright (c) 2015 Naing Lin Aung. All rights reserved.
//

import UIKit
import CoreData

class BookMark: NSManagedObject {
    @NSManaged var id: NSNumber
    @NSManaged var image: String
    @NSManaged var title: String
    @NSManaged var category: String
    @NSManaged var created_at: String
    @NSManaged var link: String
    @NSManaged var data: String
    
    func save(coll:NSDictionary) {
            self.title =  coll["title"]! as! String
            self.id    =  coll["id"]! as! Int
            self.image =  coll["image"]! as! String
            self.category = coll["category"]! as! String
            self.created_at = coll["created_at"]! as! String
            self.link  = coll["link"]! as! String
            self.data  = coll["data"]! as! String
    }
    
    func outputAsDictionary() -> NSDictionary?{
        return [
            "title" : self.title,
            "id"    : "\(self.id)",
            "image" : self.image,
            "category": self.category,
            "created_at":self.created_at,
            "link": self.link,
            "data": self.data
        ]
    }

}
