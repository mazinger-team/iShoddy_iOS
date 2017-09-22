//
//  GetAllCategoriesNetworkManager.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 7/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation



public class GetAllCategorisNetWorkManagerImpl:  GetAllCategoriesManager {
  
    public func execute(completion: @escaping listCategory, onError: @escaping errorBlock) {
        NetworkManager.sharedNetworkManager.execute(withURL: DomainUrl.oneCategories, completion: {(data:Data) in
            guard let jsonResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                //Error en el parseo
                onError(ErrorData(errorCode: nil, errorTitle: "Error en el parser", errorText: "Error en respuesta del servicio" , errorFlag: true, errorType: "T"))
                return
            }
            let listCategoriesResponseType = ListCategoriesResponseType(dictionary: jsonResponse!)
            completion(listCategoriesResponseType)
        }) { (errorData) in
            onError(ErrorData(errorCode: nil, errorTitle: nil, errorText: "Error en respuesta del servicio:", errorFlag: true, errorType: "T"))
        }
    }
 
 
 
 }
    

    
   
    

    
    
    

