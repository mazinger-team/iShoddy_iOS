//
//  PaginationDataOutputType.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 1/10/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public class PaginationDataOutputType {
    
    public var paginationData : PaginationData
    
    init() {
        paginationData = PaginationData(paginationFlag: false, paginationKey: 0, paginationElements: 0)
    }
    
    init(dictionary: [String : Any]) {
        let pagination = PaginationData(paginationFlag: dictionary["paginationFlag"] as! Bool,
                                        paginationKey: dictionary["paginationKey"] as! Int,
                                        paginationElements: dictionary["paginationElements"] as! Int)
        
        paginationData = pagination
    }
}



