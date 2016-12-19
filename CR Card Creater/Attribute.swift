//
//  Attribute.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 12/4/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import Foundation
import CoreData


class Attribute: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    class func attribute(name : String , objectID : NSManagedObjectID, inManagedObjectContext context: NSManagedObjectContext) -> Attribute?
        
    {
    
        let request  = NSFetchRequest(entityName : "Attribute")
        request.predicate = NSPredicate(format: "name == %@ && card == %@", name, objectID)
        if let attribute = (try? context.executeFetchRequest(request))?.first as? Attribute
        {
            return attribute
            
        }
        
        
        return nil
    }
}
