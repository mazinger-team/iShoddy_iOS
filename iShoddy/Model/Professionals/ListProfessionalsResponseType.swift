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
    
    init(dictionary:[String : Any]) {
        print(type(of:dictionary["professionals"]))
        self.listProfessionalsOutputType = ListProfessionalsOutputType(dictionary: dictionary["listProfessionalsOutputType"] as! Dictionary<String, Any>)
        super.init()
    }
}
