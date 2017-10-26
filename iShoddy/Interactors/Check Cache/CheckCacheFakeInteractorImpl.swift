//
//  CheckCacheInteractorImpl.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 16/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import CoreData

public class CheckCacheFakeInteractorImpl: CheckCacheInteractor{
    let context:NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    func refresh() -> Bool{
         let categoriesFetchRequest: NSFetchRequest<CategoryData> = CategoryData.fetchRequest()
        do {
            let result: [CategoryData] = try context.fetch(categoriesFetchRequest)
            if( result.count > 0){
                return false
            }
             return true
        } catch  {
             return true
        }
    }
    
}
