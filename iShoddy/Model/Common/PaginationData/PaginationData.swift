//
//  Pagination.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 9/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public struct PaginationData{
    var paginationFlag : Bool = false
    var paginationKey: Int = 0
    var paginationElements : Int = 0
    
    public static func modelsFromDictionaryArray(array:NSArray) -> [PaginationData] {
        var models:[PaginationData] = []
        for item in array {
            models.append(PaginationData(dictionary: item as! NSDictionary))
        }
        return models
    }
    
    public init(dictionary: NSDictionary) {
        paginationFlag = dictionary["paginationFlag"] as! Bool
        paginationKey = dictionary["paginationKey"] as! Int
        paginationElements = dictionary["paginationElements"] as! Int
    }
    
    public init(paginationFlag: Bool, paginationKey: Int, paginationElements: Int) {
        self.paginationFlag = paginationFlag
        self.paginationKey = paginationKey
        self.paginationElements = paginationElements
    }
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.paginationFlag, forKey: "paginationFlag")
        dictionary.setValue(self.paginationKey, forKey: "paginationKey")
        dictionary.setValue(self.paginationElements, forKey: "paginationElements")
        
        return dictionary
    }
}


