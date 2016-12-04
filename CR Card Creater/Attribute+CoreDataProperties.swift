//
//  Attribute+CoreDataProperties.swift
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

extension Attribute {

    @NSManaged var name: String?
    @NSManaged var image: String?
    @NSManaged var value: String?
    @NSManaged var card: Card?

}
