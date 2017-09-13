//
//  GetAllProfessionalImpl.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 11/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import UIKit

public class GetAllProfessionalInteractorImpl: GetAllProfessionalInteractor {
    let getAllProfessionalNetworkManager: GetAllProfessionalsNetworkManager
    
    init(getAllProfessionalsNetworkManager: GetAllProfessionalsNetworkManager ) {
        self.getAllProfessionalNetworkManager = getAllProfessionalsNetworkManager
    }
    
    public func execute(completion:@escaping  listProfessional, onError: @escaping errorBlock ) {
        getAllProfessionalNetworkManager.execute(completion: { (listProfessionalsResponseType : ListProfessionalsResponseType)  in
            completion(listProfessionalsResponseType)
        }) { (errorData:ErrorData) in
            onError(errorData)
        }
    }
}
