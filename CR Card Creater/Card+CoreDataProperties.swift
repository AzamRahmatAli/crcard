//
//  Card+CoreDataProperties.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 12/4/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Card {

    @NSManaged var name: String?
    @NSManaged var dp: NSData?
    @NSManaged var rarity: String?
    @NSManaged var type: String?
    @NSManaged var points: String?
    @NSManaged var detail: String?
    @NSManaged var attributes: NSSet?

}
