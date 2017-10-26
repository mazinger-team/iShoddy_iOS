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
        return 45.0
    }
    
    open func setData(_ data: Any)
    {
        self.backgroundColor = UIColor.clear
        self.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        self.textLabel?.textColor = UIColor.white
        
        if let menuText = data as? String {
            self.textLabel?.text = menuText
        }
    }
    
    override open func setHighlighted(_ highlighted: Bool, animated: Bool)
    {
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































