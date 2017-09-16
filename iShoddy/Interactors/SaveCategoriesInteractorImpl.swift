//
//  SaveCategoriesInteractorImpl.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 16/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation




public class SaveCategoriesInteractorImpl : SaveCategoriesInteractor{
    
    let persistCategoriesCoreData: PersistCategoriesCoreData
    
    init(persistCategoriesCoreData: PersistCategoriesCoreData ) {
        self.persistCategoriesCoreData = persistCategoriesCoreData
    }
    

    public func execute(categoriesToSave: [Category], completion: @escaping (Int) -> Void, onError: @escaping errorBlock ) {
        persistCategoriesCoreData.execute(categoriesToSave: categoriesToSave, completion: completion, onError: onError)
    }
    
}
