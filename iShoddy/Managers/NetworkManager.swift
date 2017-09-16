//
//  NetworkManager.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 10/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation


typealias clousureCompletionNM = (Data) -> Void

final class NetworkManager{
    
    static let sharedNetworkManager : NetworkManager = NetworkManager()
    fileprivate var sharedSession : URLSession
    
    private init(){
        sharedSession = URLSession(configuration: NetworkManager.configureSession() )
    }
    
    
    private static func configureSession() -> URLSessionConfiguration{
        let uRLSessionConfiguration = URLSessionConfiguration.default
        //Le configuro el timeout a 45 segundos
        uRLSessionConfiguration.timeoutIntervalForRequest = 45
        return uRLSessionConfiguration
    }
    
    public func getSession() -> URLSession{
       return sharedSession
    }
    
    private func generateURLRequest(withURL: String) -> URLRequest{
        let url = URL(string: withURL)
        return URLRequest(url:  url!)
        
    }
    
    private func generateURLRequest(withURL: URL) -> URLRequest{
        return URLRequest(url:  withURL)
    }
    
    public func execute(withURL: String, completion: @escaping clousureCompletionNM, onError: @escaping errorBlock) {
        let dataTask = sharedSession
            .dataTask(with: NetworkManager.sharedNetworkManager.generateURLRequest(withURL: DomainUrl.oneCategories ))
            { (data, response, error) in
                
                if error != nil {
                    onError(ErrorData(errorCode: nil, errorTitle: "Error en Conexión", errorText: error?.localizedDescription, errorFlag: true, errorType: "T"))
                } else {
                    guard let httpResponse = response as? HTTPURLResponse else {
                        onError(ErrorData(errorCode: nil, errorTitle: "Error en respuesta",errorText: "Unsupported protocol", errorFlag: true, errorType: "T"))
                        return
                    }
                    
                    if 200 ..< 300 ~= httpResponse.statusCode {
                        completion(data!)
                    } else {
                        //Error http
                        onError(ErrorData(errorCode: httpResponse.statusCode.description, errorTitle: "Error en Conectividad", errorText: "Error en respuesta del servicio:" + httpResponse.statusCode.description , errorFlag: true, errorType: "T"))
                    }
                }
                
                
        }
        dataTask.resume();
        
    }
    
   
    public func downloadFileFromServer(withURL: URL, andSaveTo: URL, completion: @escaping (() ->Void), onError: @escaping errorBlock) {
        // Create destination URL
        let dataTask = sharedSession
            .downloadTask(with: NetworkManager.sharedNetworkManager.generateURLRequest(withURL: withURL ))
            { (tempLocalUrl, response, error) in
                if let tempLocalUrl = tempLocalUrl, error == nil {
                    // Success
                    if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                        print("Successfully downloaded. Status code: \(statusCode)")
                    }
                    do {
                        try FileManager.default.copyItem(at: tempLocalUrl, to: andSaveTo)
                        completion()
                    } catch (let writeError) {
                        print("Error creating a file \(andSaveTo) : \(writeError)")
                    }
                    
                } else {
                    print("Error took place while downloading a file. Error description: %@", error?.localizedDescription ?? "Error no localizado");
                }
        }

        dataTask.resume();
        

        
    }
    
    
}

