//
//  GetProfessionalsNetworkManagerImpl.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 11/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import UIKit

public class GetProfessionalsNetWorkManagerImpl:  GetProfessionalsNetworkManager {
    public func execute(filter: String?, order: String?, fields: String?, page: Int, completion: @escaping listProfessional, onError: @escaping errorBlock) {
        var urlProfessionals: String = DomainUrl.listProfessionals
        var indParameters: Bool = false
        
        if let filter = filter {
            if filter != "" {
                urlProfessionals = urlProfessionals+"?"+filter
                indParameters = true
            }
        }
        
        if let order = order {
            if order != "" {
                if !indParameters {
                    urlProfessionals = urlProfessionals+"?"
                    indParameters = true
                } else {
                    urlProfessionals = urlProfessionals+"&"
                }
                urlProfessionals = urlProfessionals+"order="+order
            }
        }
        
        if let fields = fields {
            if fields != "" {
                if !indParameters {
                    urlProfessionals = urlProfessionals+"?"
                    indParameters = true
                } else {
                    urlProfessionals = urlProfessionals+"&"
                }
                urlProfessionals = urlProfessionals+"fields="+fields
            }
        }
        
        if page != 0 {
            if !indParameters {
                urlProfessionals = urlProfessionals+"?"
                indParameters = true
            } else {
                urlProfessionals = urlProfessionals+"&"
            }
            urlProfessionals = urlProfessionals+"page="+String(describing: page)
        }
        
        NetworkManager.sharedNetworkManager.execute(withURL: DomainUrl.listProfessionals, completion: {(data:Data) in
            guard let jsonResponse = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                //Error en el parseo
                onError(ErrorData(errorCode: nil, errorTitle: "Error en el parser", errorText: "Error en respuesta del servicio" , errorFlag: true, errorType: "T"))
                return
            }
            let listProfessionalsResponseType = ListProfessionalsResponseType(dictionary: jsonResponse!)
            completion(listProfessionalsResponseType)
        }) { (errorData) in
            onError(ErrorData(errorCode: nil, errorTitle: nil, errorText: "Error en respuesta del servicio:", errorFlag: true, errorType: "T"))
        }
    }

    public func downloadProfessionalImage(professional: Professional, completion: @escaping (UIImage) -> Void) {
        DispatchQueue.global().async {
            if let url = URL(string: professional.logo_url!) {
                do {
                    let data = try Data(contentsOf: url)
                    let image = UIImage(data: data)
                    
                    DispatchQueue.main.async {
                        completion(image!)
                    }
                } catch {
                    print("Error in downloadCardImage " + error.localizedDescription)
                }
            }
        }
    }
}
