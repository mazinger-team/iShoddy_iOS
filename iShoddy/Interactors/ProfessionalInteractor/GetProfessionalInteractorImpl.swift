//
//  GetProfessionalImpl.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 11/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import UIKit

public class GetProfessionalInteractorImpl: GetProfessionalInteractor {
    let getProfessionalNetworkManager: GetProfessionalsNetworkManager
    
    init(getProfessionalsNetworkManager: GetProfessionalsNetworkManager ) {
        self.getProfessionalNetworkManager = getProfessionalsNetworkManager
    }
    
    public func execute(completion:@escaping  listProfessional, onError: @escaping errorBlock ) {
        getProfessionalNetworkManager.execute(completion: { (listProfessionalsResponseType : ListProfessionalsResponseType)  in
            completion(listProfessionalsResponseType)
        }) { (errorData:ErrorData) in
            onError(errorData)
        }
    }
}
