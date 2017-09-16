//
//  GetAllCategoriesInteractorCoreData.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 16/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation


public class GetAllCategoriesInteractorCoreDataImpl: GetAllCategoriesInteractor{
    
    let getAllCategoriesManager: GetAllCategoriesManager
    
    init(getAllCategoriesManager: GetAllCategoriesManager ) {
        self.getAllCategoriesManager = getAllCategoriesManager
    }
    
    
    public func execute(completion:@escaping  listCategory, onError: @escaping errorBlock ) {
        getAllCategoriesManager.execute(completion: { (listCategoriesResponseType : ListCategoriesResponseType)  in
            completion(listCategoriesResponseType)
        }) { (errorData:ErrorData) in
            onError(errorData)
        }
        
        
    }
    
}
