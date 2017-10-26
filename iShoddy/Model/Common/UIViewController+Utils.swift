//
//  UIViewController+Utils.swift
//  iShoddy
//
//  Created by David Cava Jimenez on 16/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    
    func appDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func showError(withError: ErrorData){
        var popViewController : Dialog!
        DispatchQueue.main.async {
            let bundle = Bundle(for: Dialog.self)
            popViewController = Dialog(nibName: "Dialog", bundle: bundle)
            popViewController.showInView(self.view, withImage: UIImage(named: "typpzDemo"),withTitle: withError.errorTitle ?? "", withMessage: withError.errorText, animated: true)
            
        }
    }
    
}

