//
//  Category.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 7/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import CoreData

public class Category: ManagedObject {
    var id : Int = 0
    var active : Bool
    var name : String
    var urlLogo: String
    var subcategories: [SubCategory]
    
    init(id: Int, active: Bool, name:String, urlLogo: String, subcategories: [SubCategory]) {
        self.id = id
        self.active = active
        self.name = name
        self.urlLogo = urlLogo
        self.subcategories = subcategories
       
    }
    
    init(categoryData: CategoryData) {
        self.id = Int(categoryData.id)
        self.active = categoryData.active
        self.name = categoryData.name!
        self.urlLogo = categoryData.urlLogo!
        self.subcategories =  [SubCategory]()
        
        for subCategoryData  in categoryData.subcategories! {
            self.subcategories.append(SubCategory(subCategoryData: subCategoryData as! SubcategoryData))
        }
    }
    
}



extension Category {
  
    public static func insertIntoContext(context: NSManagedObjectContext, category: Category) -> Void{
            
            let newCategory : CategoryData = context.insertIntoObject()
            newCategory.id = Int64(category.id)
            newCategory.active = category.active
            newCategory.name = category.name
            newCategory.urlLogo = category.urlLogo

 
            for subCategory in category.subcategories {
               let newSubcategory : SubcategoryData = context.insertIntoObject()
                newSubcategory.idCategory = newCategory
                newSubcategory.id = Int64( subCategory.id! )
                newSubcategory.active = subCategory.active!
                newSubcategory.modificationDate = Date()
                newSubcategory.name = subCategory.name
            }

        }
        
        
}





