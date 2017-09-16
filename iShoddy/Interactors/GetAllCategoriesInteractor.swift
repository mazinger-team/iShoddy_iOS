//
//  GetAllCategories.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 7/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public typealias listCategory =  ( ListCategoriesResponseType )  -> Void

public protocol GetAllCategoriesInteractor{
    func execute(completion:@escaping  listCategory, onError: @escaping errorBlock )
}

