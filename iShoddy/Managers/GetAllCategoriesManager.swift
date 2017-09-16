//
//  GetAllCategoriesNetworkManager.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 7/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation


public protocol GetAllCategoriesManager {
     func execute(completion: @escaping listCategory, onError: @escaping errorBlock) -> Void
}
