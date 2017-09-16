//
//  DomainUrl.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 10/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation


public typealias errorBlock = (ErrorData) -> Void

public class DomainUrl{
    
    fileprivate static let BASE = "http://www.mocky.io"
    
    
    public static var listCategories : String {
                                return DomainUrl.BASE + "/v2/59b6e7930f00002707712607"
                        }
    
    public static var oneCategories : String {
        return DomainUrl.BASE + "/v2/59badac50f00005104622a16"
    }
    
    //Añadir los siguientes endpoint's aqui.
    
}
