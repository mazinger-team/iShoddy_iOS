//
//  GetFileFromServerInteractor.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 12/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import UIKit

public class GetImageFilesInteractor{
    
     let getFileFromServerManager: GetFileFromServerManager
    
    init(getFileFromServerManager: GetFileFromServerManager ) {
        self.getFileFromServerManager = getFileFromServerManager
    }
    
    public func execute(withUrl: URL,completion:@escaping  ((UIImage, Bool) -> Void) , onError: @escaping errorBlock ) {
        getFileFromServerManager.execute(withUrl: withUrl, completion: completion, onError: onError)
    }
    
}

