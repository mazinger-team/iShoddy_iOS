//
//  BaseTableViewCell.swift
//  iShoddy
//
//  Created by JJLZ on 9/27/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    class var identifier: String {
        return String.className(self)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    open func setup()
    {
        
    }
    
    open class func height() -> CGFloat
    {
        return 48.0
    }
    
    open func setData(_ data: Any)
    {
        // TODO: Hacer pruebas con esto
        self.backgroundColor = UIColor.blue
        self.textLabel?.font = UIFont.italicSystemFont(ofSize: 18)
        self.textLabel?.textColor = UIColor.green
        
        if let menuText = data as? String {
            self.textLabel?.text = menuText
        }
    }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool) {
        // TODO: Hacer pruebas con esto
        if highlighted {
            self.alpha = 0.4
        } else {
            self.alpha = 1.0
        }
    }
    
    // Ignore the default handling
    override func setSelected(_ selected: Bool, animated: Bool) {
    }
}































