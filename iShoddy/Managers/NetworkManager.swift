//
//  NetworkManager.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 10/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

final class NetworkManager {
    
    static let sharedNetworkManager : NetworkManager = NetworkManager()
    fileprivate var sharedSession : URLSession
    
    private init() {
        sharedSession = URLSession(configuration: NetworkManager.configureSession())
    }
    
    private static func configureSession() -> URLSessionConfiguration {
        let uRLSessionConfiguration = URLSessionConfiguration.default
        //Le configuro el timeout a 45 segundos
        uRLSessionConfiguration.timeoutIntervalForRequest = constants.NSURLSessionTimeoutIntervalForRequest
        return uRLSessionConfiguration
    }
    
    public func getSession() -> URLSession {
        return sharedSession
    }
    
    public func generateURLRequest(withURL: String) -> URLRequest{
        let url = URL(string: withURL)
        return URLRequest(url:  url!)
    }
}
