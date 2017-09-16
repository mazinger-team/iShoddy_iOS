//
//  NSManagedObjectContext.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 16/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import CoreData

extension NSManagedObjectContext{
    
   
    public func insertIntoObject<A: NSManagedObject & ManagedObjectType> () -> A{
        guard let obj = NSEntityDescription.insertNewObject(forEntityName: A.entityName, into: self) as? A
            else {
                 fatalError("La cagamos compadre")
                
        }
        
        
        return obj
        
    }
}


