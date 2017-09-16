//
//  PersistCategoriesCoreDataImpl.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 16/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import CoreData


public class PersistCategoriesCoreDataImpl: PersistCategoriesCoreData {
    
    let context:NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    
    public func execute(categoriesToSave: [Category], completion: @escaping (Int) -> Void, onError: @escaping errorBlock) {
        var count  = 0
        for category in categoriesToSave {
           Category.insertIntoContext(context: context, category: category)
           count = count + 1
        }
        completion(count);
        
    }
    
}
