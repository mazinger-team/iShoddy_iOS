//
//  Constants.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 9/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation
import UIKit

struct constants {
    //MARK: - Error Data
    static let erorrDataHeader = "errorData"
    
    //MARK: - Pagination Data
    static let paginationDataHeader = "paginationData"
    
    //MARK: - Professional
    static let ProfessionalCollectionViewCell = "ProfessionalCell"
    static let professionalCollectionViewNumberOfSections = 1
    static let professionalCollectionViewNumberOfItemsInSection = 20
    static let professionalOutputHeaderList = "listProfessionalsOutputType"
    
    //MARK: - Professional Detail
    static let professionalDetailSegue = "DetailProfessionalSegue"
    
    //Images
    static let ProfessionalImageDefault = "professional-default"
    static let PngExtension = "png"
    
    //MARK: - NSURLSession
    static let NSURLSessionTimeoutIntervalForRequest: Double = 45
    
    // MARK: Colors
    static let appPrimaryColor = UIColor(hue: 283/360, saturation: 0.61, brightness: 0.72, alpha: 1.0)
    static let backgroundColor = UIColor(red: 236.0, green: 238.0, blue: 241.0, alpha: 1.0)
}

// Notes:

/*
If you wanted to use HSB, you need to:

Divide the hue value by 360
Use decimals for the Saturation and Brightness values
So, say for example that Sketch is telling you the colour values in HSB are: Hue: 20, Saturation: 72 and Brightness: 96

In Xcode, create the colour as follows:

let myAwesomeColour = UIColor(hue: 20/360, saturation: 0.72, brightness: 0.96, alpha: 1.0
*/

