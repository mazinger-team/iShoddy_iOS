//
//  PaginationDataResponseType.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 1/10/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public class PaginationDataResponseType : BaseModel {
    let paginationDataOutputType : PaginationDataOutputType
    
    override init() {
        paginationDataOutputType = PaginationDataOutputType()
        super.init()
    }
    
    init(dictionary:[String : Any]) {
        let headerData = dictionary["headerData"] as! Dictionary<String, Any>
        self.paginationDataOutputType = PaginationDataOutputType(dictionary: headerData[constants.paginationDataHeader] as! Dictionary<String, Any> )
        super.init()
    }
}

