//
//  TableViewExtension.swift
//  iShoddy
//
//  Created by JJLZ on 9/27/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

public extension UITableView {
    
    func registerCellClass(_ cellClass: AnyClass) {
        let identifier = String.className(cellClass)
        self.register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    // TODO: 3 Revisar si son necesarias
//    func registerCellNib(_ cellClass: AnyClass) {
//        let identifier = String.className(cellClass)
//        let nib = UINib(nibName: identifier, bundle: nil)
//        self.register(nib, forCellReuseIdentifier: identifier)
//    }
//
//    func registerHeaderFooterViewClass(_ viewClass: AnyClass) {
//        let identifier = String.className(viewClass)
//        self.register(viewClass, forHeaderFooterViewReuseIdentifier: identifier)
//    }
//
//    func registerHeaderFooterViewNib(_ viewClass: AnyClass) {
//        let identifier = String.className(viewClass)
//        let nib = UINib(nibName: identifier, bundle: nil)
//        self.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
//    }
}
