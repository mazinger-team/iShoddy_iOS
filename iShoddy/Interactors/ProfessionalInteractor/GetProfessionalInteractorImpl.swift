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
    
    public func execute(filter: String?, order: String?, fields: String?, page: Int, completion: @escaping  listProfessional, onError: @escaping errorBlock ) {
        getProfessionalNetworkManager.execute(filter: filter, order: order, fields: fields, page: page, completion: { (listProfessionalsResponseType : ListProfessionalsResponseType)  in
            completion(listProfessionalsResponseType)
        }) { (errorData:ErrorData) in
            onError(errorData)
        }
    }
}
