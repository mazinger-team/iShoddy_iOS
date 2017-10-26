//
//  UserDataService.swift
//  iShoddy
//
//  Created by JJLZ on 10/24/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

class UserDataService
{
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var email = ""
    
    func setUserData(id: String, email: String)
    {
        self.id = id
        self.email = email
    }
    
    func logoutClientUser()
    {
        id = ""
        email = ""
        AuthService.instance.isLoogedIn = false
        AuthService.instance.userEmail = ""
        AuthService.instance.authToken = ""
        AuthService.instance.userID = ""
    }
}
