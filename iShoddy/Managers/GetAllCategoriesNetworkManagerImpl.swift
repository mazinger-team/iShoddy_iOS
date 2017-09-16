//
//  GetAllCategoriesNetworkManager.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 7/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation



public class GetAllCategorisNetWorkManagerImpl{
    
    let urlSession: URLSession
    
    
    init() {
        urlSession = URLSession (configuration: .default)
    }
    
    
    
    func execute(urlRequest: URLRequest) -> Void {
        urlSession.dataTask(with: urlRequest) { (Data, response, error) in
            
            
            
        }
    }
    
    
    
    
}
