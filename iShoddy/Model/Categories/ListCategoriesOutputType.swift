//
//  ListCategoriesOutputType.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 9/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation


public class ListCategoriesOutputType   {
    
    public var categories : [Category]
    
    init() {
       categories = [Category] ()
    }
    
    init( dictionary: [String : Any]) {
        categories = [Category]()
    
        if let arrayCategory = dictionary[ "categories" ] as? Array<[String : Any ]>{
            for categoryDictionary in arrayCategory as Array {
                
                let subCategories = categoryDictionary[ "subcategories" ] as? Array<[String : Any ]>
                var arraySubcategories = [SubCategory] ()
                for subcategory in subCategories! {
                    arraySubcategories.append(SubCategory(dictionary: subcategory)!)
                }
                
              
                let category = Category(id: categoryDictionary["id"] as! Int, active: categoryDictionary["active"] as! Bool, name: categoryDictionary["name"] as! String, urlLogo:  categoryDictionary["urlLogo"]  as! String, subcategories: arraySubcategories)
                
               
                categories.append(category)
                
            }
        }

    }
   
    
}
