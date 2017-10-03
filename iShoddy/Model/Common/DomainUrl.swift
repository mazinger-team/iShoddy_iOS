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
    
    fileprivate static let BASE = "http://ec2-54-202-209-58.us-west-2.compute.amazonaws.com"
    fileprivate static let BASE_mock = "http://www.mocky.io"
    
    public static var listCategories : String {
        return DomainUrl.BASE_mock + "/v2/59b2d63b120000de05892490"
    }
    
    public static var oneCategories : String {
        return DomainUrl.BASE_mock + "/v2/59badac50f00005104622a16"
    }
    
    //Añadir los siguientes endpoint's aqui.    
    public static var listProfessionals: String {
        return DomainUrl.BASE + "/api/v1/professionals"
        //return DomainUrl.BASE + "/v2/59bc19d60f00003a05ff8837"
        
    }
}

