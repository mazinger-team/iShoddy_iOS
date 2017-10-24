//
//  ImageHeaderView.swift
//  iShoddy
//
//  Created by JJLZ on 9/27/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import UIKit

class ImageHeaderView: UIView {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // TODO: Hacer pruebas con esto
        self.backgroundColor = constants.appPrimaryColor
        self.profileImage.layoutIfNeeded()
        self.profileImage.layer.cornerRadius = self.profileImage.bounds.size.height / 2
        self.profileImage.clipsToBounds = true
        self.profileImage.layer.borderWidth = 1
        self.profileImage.layer.borderColor = UIColor.white.cgColor

        // TODO: Revisar esta parte
//        self.profileImage.setRandomDownloadImage(80, height: 80)
//        self.backgroundImage.setRandomDownloadImage(Int(self.bounds.size.width), height: 160)
    }
}
