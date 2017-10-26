//
//  AuthService.swift
//  iShoddy
//
//  Created by JJLZ on 10/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

typealias CompletionHandler = (_ Success: Bool) -> ()

// MARK: User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
let USER_ID = "userID"
//--

class AuthService {
    
    static let instance = AuthService()
    
    let defaults = UserDefaults.standard
    
    var isLoogedIn : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken: String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail: String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    var userID: String {
        get {
            return defaults.value(forKey: USER_ID) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_ID)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler)
    {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(DomainUrl.registerAsClientURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: DomainUrl.HEADER).responseString { (response) in
            
            if response.response?.statusCode == 200 && response.result.error == nil {
                
                guard let data = response.data else {
                    return
                }
                
                self.setUserData(data: data)
                
                // Get token from Header
                if let headers = response.response?.allHeaderFields as? [String: String] {
                    let header = headers["x-auth"]
                    self.authToken = header!
                }
                
                self.isLoogedIn = true
                completion(true)
            
            } else {
                
                completion(false)
                
                // TODO 1: error handler
                debugPrint(response.result.error as Any)
                debugPrint(response.response?.statusCode as Any)
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler)
    {
        let lowerCaseEmail = email.lowercased()
        
        let body: [String: Any] = [
            "email": lowerCaseEmail,
            "password": password
        ]
        
        Alamofire.request(DomainUrl.clientUserLoginURL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: DomainUrl.HEADER).responseJSON { (response) in
            
            if response.response?.statusCode == 200 && response.result.error == nil {

                guard let data = response.data else {
                    return
                }

                self.setUserData(data: data)
                
                // Get token from Header
                if let headers = response.response?.allHeaderFields as? [String: String] {
                    let header = headers["x-auth"]
                    self.authToken = header!
                }
                
                self.isLoogedIn = true
                
                completion(true)
                
            } else {
                completion(false)
                
                // TODO 1: Error handler
                debugPrint(response.result.error as Any)
                debugPrint(response.response?.statusCode as Any)
            }
        }
    }
    
    func logoutUser(token: String, completion: @escaping CompletionHandler)
    {
        let tokenHeader = [
            "x-auth": token
        ]
        
        Alamofire.request(DomainUrl.clientUserLogoutURL, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: tokenHeader).responseJSON { (response) in
            
//            if response.response?.statusCode == 200 && response.result.error == nil {
            if response.response?.statusCode == 200  {
                
                self.isLoogedIn = false
                
                completion(true)
                
            } else {
                completion(false)
                
                debugPrint(response.result.error as Any)
                debugPrint(response.response?.statusCode as Any)
            }
        }
    }
    
    func setUserData(data: Data)
    {
        let json = JSON(data: data)
        let id = json["_id"].stringValue
        let email = json["email"].stringValue
        
        UserDataService.instance.setUserData(id: id, email: email)
    }
}































