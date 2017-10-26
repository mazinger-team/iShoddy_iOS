//
//  ErrorDataResponseType.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 1/10/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public class ErrorDataResponseType : BaseModel {
    let errorDataOutputType : ErrorDataOutputType
    
    override init() {
        errorDataOutputType = ErrorDataOutputType()
        super.init()
    }
    
    init(dictionary:[String : Any]) {
        self.errorDataOutputType = ErrorDataOutputType(dictionary: dictionary[constants.erorrDataHeader] as! Dictionary<String, Any> )
        super.init()
    }
}


