//
//  CategoryProfessionalList
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 11/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//
import Foundation

public class CategoryProfessionalList {
    public var _id : String?
    public var name : String?
    
    init(id: String?, name: String?) {
        self._id = id
        self.name = name
    }
    
    public static func modelsFromDictionaryArray(array:NSArray) -> [CategoryProfessionalList] {
        var models:[CategoryProfessionalList] = []
        for item in array {
            models.append(CategoryProfessionalList(dictionary: (item as! NSDictionary) as! Dictionary<String, Any>)!)
        }
        return models
    }
    
    init?(dictionary: Dictionary<String, Any>) {
        _id = dictionary["_id"] as? String
        name = dictionary["name"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self._id, forKey: "_id")
        dictionary.setValue(self.name, forKey: "name")
        return dictionary
    }
}

