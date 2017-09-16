//
//  ListCategoriesResponseType.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 9/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation


public class ListCategoriesResponseType : BaseModel{
    
    let listCategoriesOutputType : ListCategoriesOutputType
    

    override init() {
        listCategoriesOutputType = ListCategoriesOutputType()
        super.init()
    }
    
    init(dictionary:[String : Any]) {
        self.listCategoriesOutputType = ListCategoriesOutputType(dictionary: dictionary["listCategoriesOutputType"] as! Dictionary<String, Any> )
        super.init()
       
    }
    
    
}
