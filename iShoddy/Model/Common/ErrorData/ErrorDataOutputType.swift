//
//  ErrorDataOutputType.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 1/10/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public class ErrorDataOutputType {
    public var errorData : [ErrorData]
    
    init() {
        errorData = [ErrorData] ()
    }
    
    init(dictionary: [String : Any]) {
        errorData = [ErrorData]()
        
        let error = ErrorData(errorCode: dictionary["errorCode"] as? String,
                              errorTitle: dictionary["errorTitle"] as? String,
                              errorText: dictionary["errorText"] as? String,
                              errorFlag: dictionary["errorFlag"] as? Bool,
                              errorType: dictionary["errorType"] as? String)
        
        errorData.append(error)
    }
}

