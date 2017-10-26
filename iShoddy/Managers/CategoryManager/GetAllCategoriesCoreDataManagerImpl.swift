//
//  GetAllCategoriesCoreDataManagerImpl.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 16/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import CoreData

public class GetAllCategoriesCoreDataManagerImpl:  GetAllCategoriesManager {
    
    let context:NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    public func execute(completion: @escaping listCategory, onError: @escaping errorBlock) {
        let categoriesFetchRequest: NSFetchRequest<CategoryData> = CategoryData.fetchRequest()
        let sort = NSSortDescriptor(key: "id", ascending: true)
        categoriesFetchRequest.sortDescriptors = [sort]
        do {
            let result: [CategoryData] = try context.fetch(categoriesFetchRequest)
            var categories: [Category] = [Category]()
                for categoryData in result {
                    categories.append(Category(categoryData: categoryData))
                }
            let listCategoriesResponseType = ListCategoriesResponseType()
            listCategoriesResponseType.listCategoriesOutputType.categories = categories
            
            completion(listCategoriesResponseType)
        } catch {
          //  if let errorClosure = onError {
          //      errorClosure(error)
          //  }
        }
        
        
        
    }
    
    
    
}
