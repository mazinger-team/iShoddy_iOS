//
//  ManagedObjectType.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 16/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation


public protocol ManagedObjectType:class {
    static var entityName:String { get }
    
}
