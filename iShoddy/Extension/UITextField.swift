//
//  UITextField.swift
//  iShoddy
//
//  Created by JJLZ on 10/3/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

extension UITextField
{
    func applyPrimaryColorBorder()
    {
        self.layer.borderColor = constants.appPrimaryColor.cgColor
        self.layer.borderWidth = 1.5
        self.layer.cornerRadius = 5
        self.layer.masksToBounds = true
    }
}
