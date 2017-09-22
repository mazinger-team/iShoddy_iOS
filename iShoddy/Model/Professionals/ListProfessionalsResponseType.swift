//
//  ListProfessionalsResponseType.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 11/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public class ListProfessionalsResponseType : BaseModel {
    let listProfessionalsOutputType : ListProfessionalsOutputType
    
    
    override init() {
        listProfessionalsOutputType = ListProfessionalsOutputType()
        super.init()
    }
    
    init(dictionary:[String : Any]) {
        self.listProfessionalsOutputType = ListProfessionalsOutputType(dictionary: dictionary["listProfessionalsOutputType"] as! Dictionary<String, Any> )
        super.init()
        
    }
}
