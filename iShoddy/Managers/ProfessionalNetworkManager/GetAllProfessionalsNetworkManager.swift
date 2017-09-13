//
//  GetAllProfessionalsNetworkManager.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 11/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import UIKit

public protocol GetAllProfessionalsNetworkManager {
    func execute(completion: @escaping listProfessional, onError: @escaping errorBlock) -> Void
    func downloadProfessionalImage(professional: Professional, completion: @escaping (UIImage) -> Void)
}
