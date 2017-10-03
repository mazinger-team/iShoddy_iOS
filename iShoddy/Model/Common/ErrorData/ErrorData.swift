//
//  ErrorData.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 9/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public struct ErrorData{
    var errorCode: String? = ""
    var errorTitle: String? = ""
    var errorText: String? = ""
    var errorFlag: Bool? = false
    var errorType: String? = ""
    
    
    public static func modelsFromDictionaryArray(array:NSArray) -> [ErrorData] {
        var models:[ErrorData] = []
        for item in array {
            models.append(ErrorData(dictionary: item as! NSDictionary))
        }
        return models
    }
    
    public init(dictionary: NSDictionary) {
        errorCode = dictionary["errorCode"] as? String
        errorTitle = dictionary["errorTitle"] as? String
        errorText = dictionary["errorText"] as? String
        errorFlag = dictionary["errorFlag"] as? Bool
        errorType = dictionary["errorType"] as? String
    }
    
    public init(errorCode: String?, errorTitle: String?, errorText: String?, errorFlag: Bool?, errorType: String?) {
        self.errorCode = errorCode
        self.errorTitle = errorTitle
        self.errorText = errorText
        self.errorFlag = errorFlag
        self.errorType = errorType
    }
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.errorCode, forKey: "errorCode")
        dictionary.setValue(self.errorTitle, forKey: "errorTitle")
        dictionary.setValue(self.errorText, forKey: "errorText")
        dictionary.setValue(self.errorFlag, forKey: "errorFlag")
        dictionary.setValue(self.errorType, forKey: "errorType")
        
        return dictionary
    }
    
}

