//
//  SaveCategoriesInteractor.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 16/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation


public protocol SaveCategoriesInteractor{
  func execute(categoriesToSave: [Category], completion: @escaping (Int) -> Void, onError: @escaping errorBlock )
}
