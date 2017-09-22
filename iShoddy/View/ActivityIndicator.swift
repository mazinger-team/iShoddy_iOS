//
//  ActivityIndicator.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 15/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: Activity Indicator
    
    func activityIndicator(show: Bool) {
        activityIndicator(show: show, style: .gray)
    }
    
    func activityIndicator(show: Bool, style: UIActivityIndicatorViewStyle) {
        var spinner: UIActivityIndicatorView? = viewWithTag(NSIntegerMax - 1) as? UIActivityIndicatorView
        
        if spinner != nil {
            spinner?.removeFromSuperview()
            spinner = nil
        }
        
        if spinner == nil && show {
            spinner = UIActivityIndicatorView.init(activityIndicatorStyle: style)
            spinner?.translatesAutoresizingMaskIntoConstraints = false
            spinner?.hidesWhenStopped = true
            spinner?.tag = NSIntegerMax - 1
            
            if Thread.isMainThread {
                if show {
                    spinner?.startAnimating()
                } else {
                    spinner?.stopAnimating()
                }
            } else {
                DispatchQueue.main.async {
                    if show {
                        spinner?.startAnimating()
                    } else {
                        spinner?.stopAnimating()
                    }
                }
            }
            
            insertSubview((spinner)!, at: 0)
            
            NSLayoutConstraint.init(item: spinner!, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0).isActive = true
            NSLayoutConstraint.init(item: spinner!, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0).isActive = true
            
            spinner?.isHidden = !show
        }
    }
    
}
