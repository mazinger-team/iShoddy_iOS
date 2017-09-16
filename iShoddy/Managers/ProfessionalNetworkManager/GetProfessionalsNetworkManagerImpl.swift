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
        
        let dataTask = NetworkManager.sharedNetworkManager.getSession()
            .dataTask(with: NetworkManager.sharedNetworkManager.generateURLRequest(withURL: urlProfessionals)) { (data, response, error) in
                if error != nil {
                    onError(ErrorData(errorText: error?.localizedDescription, errorFlag: true, errorType: "T"))
                } else {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        onError(ErrorData(errorText: "Unsupported protocol", errorFlag: true, errorType: "T"))
                        return
                    }
                    
                    if 200 ..< 300 ~= httpResponse.statusCode {
                        guard let jsonResponse = try? JSONSerialization.jsonObject(with: data!) as? [String: Any] else {
                            //Error en el parseo
                            onError(ErrorData(errorText: "Error en respuesta del servicio:" + httpResponse.statusCode.description , errorFlag: true, errorType: "T"))
                            return
                        }
sleep(2)
                        let listProfessionalsResponseType = ListProfessionalsResponseType(dictionary: jsonResponse!)
                        completion(listProfessionalsResponseType)
                    } else {
                        //Error http
                        onError(ErrorData(errorText: "Error en respuesta del servicio:" + httpResponse.statusCode.description , errorFlag: true, errorType: "T"))
                    }
                }
        }
        dataTask.resume();
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
