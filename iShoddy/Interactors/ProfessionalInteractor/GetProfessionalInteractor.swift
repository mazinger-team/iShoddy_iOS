//
//  ProfessionalInteractor.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 9/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public typealias listProfessional =  ( ListProfessionalsResponseType )  -> Void


public protocol GetProfessionalInteractor {
    func execute(completion:@escaping  listProfessional, onError: @escaping errorBlock )
}
