//
//  Professional.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 11/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

/* For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar */

public struct Professional {
    public var _id : String?
    public var user_name : String?
    public var corp_name : String?
    public var category : CategoryProfessionalList?
    public var logo_url : String?
    public var rating : Double?
    public var reviews_number : Int?
    public var photo_number : Int?
    public var distance : Double?
    
    init(id: String?, user_name: String?, corp_name: String?, category: CategoryProfessionalList?, logo_url: String?, rating : Double?, reviews_number : Int?,
         photo_number: Int?, distance: Double?) {
        self._id = id
        self.user_name = user_name
        self.corp_name = corp_name
        self.category = category
        self.logo_url = logo_url
        self.rating = rating
        self.reviews_number = reviews_number
        self.photo_number = photo_number
        self.distance = distance
    }
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let professionals_list = Professionals.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of Professionals Instances.
     */
    /* public class func modelsFromDictionaryArray(array:NSArray) -> [Professionals]
     {
     var models:[Professionals] = []
     for item in array
     {
     models.append(Professionals(dictionary: item as! NSDictionary)!)
     }
     return models
     }*/
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let professionals = Professionals(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Professionals Instance.
     */
    /*required public init?(dictionary: NSDictionary) {
     
     _id = dictionary["_id"] as? String
     user_name = dictionary["user_name"] as? String
     if (dictionary["category"] != nil) { category = Category(dictionary: dictionary["category"] as! NSDictionary) }
     logo_url = dictionary["logo_url"] as? String
     rating = dictionary["rating"] as? Double
     reviews_number = dictionary["reviews_number"] as? Int
     photo_number = dictionary["photo_number"] as? Int
     distance = dictionary["distance"] as? Double
     }*/
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    /*public func dictionaryRepresentation() -> NSDictionary {
     
     let dictionary = NSMutableDictionary()
     
     dictionary.setValue(self._id, forKey: "_id")
     dictionary.setValue(self.user_name, forKey: "user_name")
     dictionary.setValue(self.category?.dictionaryRepresentation(), forKey: "category")
     dictionary.setValue(self.logo_url, forKey: "logo_url")
     dictionary.setValue(self.rating, forKey: "rating")
     dictionary.setValue(self.reviews_number, forKey: "reviews_number")
     dictionary.setValue(self.photo_number, forKey: "photo_number")
     dictionary.setValue(self.distance, forKey: "distance")
     
     return dictionary
     }*/
}


