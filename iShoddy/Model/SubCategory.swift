//
//  SubCategory.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 9/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//
import Foundation

public class SubCategory {
    public var id : Int?
    public var name : String?
    public var active : Bool?
    public var modificationDate : String?
    public var idCategory : Int?
    
    init(subCategoryData: SubcategoryData) {
        self.id = Int(subCategoryData.id)
        self.active = subCategoryData.active
        self.name = subCategoryData.name!
        self.modificationDate = subCategoryData.modificationDate?.description
 
    }
    
    public static func modelsFromDictionaryArray(array:NSArray) -> [SubCategory]
    {
        var models:[SubCategory] = []
        for item in array
        {
            models.append(SubCategory(dictionary: (item as! NSDictionary) as! Dictionary<String, Any>)!)
        }
        return models
    }
   
     init?(dictionary: Dictionary<String, Any>) {
        
        id = dictionary["id"] as? Int
        name = dictionary["name"] as? String
        active = dictionary["active"] as? Bool
        modificationDate = dictionary["modificationDate"] as? String
        idCategory = dictionary["idCategory"] as? Int
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.id, forKey: "id")
        dictionary.setValue(self.name, forKey: "name")
        dictionary.setValue(self.active, forKey: "active")
        dictionary.setValue(self.modificationDate, forKey: "modificationDate")
        dictionary.setValue(self.idCategory, forKey: "idCategory")
        
        return dictionary
    }
    
}



