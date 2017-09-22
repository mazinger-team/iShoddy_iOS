//
//  BaseModel.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 9/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public class BaseModel {
    public var headerData : HeaderData?
    
    init() {
        
    }
    
    init(headerData:HeaderData) {
        self.headerData = headerData
    }
}
