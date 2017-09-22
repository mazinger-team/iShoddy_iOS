//
//  Offer.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 8/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public class Professional {
    //MARK: Declare
    // Offer properties
    let offerId: String
    let offerUserId: String
    let offerUserName: String
    let offerCategoryId: String
    let offerSubcategoryId: String
    let offerCorporateName: String
    var offerLogoUrl: String? = ""
    let offerImagesUrl: [String]?
    let offerDescription: String
    let offerFiscalId: String
    let offerStreet: String
    let offerPostalCode: Int32
    var offerArea: String? = ""
    let offerCity: String
    let offerProvince: String
    var offerGpsLat: Double? = 0
    var offerGpsLon: Double? = 0
    var offerWebURL: String? = ""
    var offerMail: String? = ""
    var offerTelephone1: String? = ""
    var offerOpeningHours: String? = ""
    var offerRateVisit: Double? = 0
    var offerRateHour: Double? = 0
    var offerRateNotes: String? = ""
    var offerRatingAccumulated: Double = 0
    var offerRatingVotes: Double = 0
    var offerRaing: Int32 = -1
    let offerRegisterDate: Date

    //MARK: Initialization
    init(offerId:String, offerUserId:String, offerUserName:String, offerCategoryId:String, offerSubcategoryId:String, offerCorporateName:String,
         offerLogoUrl:String, offerImagesUrl:[String], offerDescription:String, offerFiscalId:String, offerStreet:String, offerPostalCode:Int32,
         offerArea:String, offerCity:String, offerProvince:String, offerGpsLat:Double, offerGpsLon:Double, offerWebURL:String, offerMail:String,
         offerTelephone1:String, offerOpeningHours:String, offerRateVisit:Double, offerRateHour:Double, offerRateNotes:String,
         offerRatingAccumulated:Double, offerRatingVotes:Double, offerRaing:Int32, offerRegisterDate:Date) {
        self.offerId = offerId
        self.offerUserId = offerUserId
        self.offerUserName = offerUserName
        self.offerCategoryId = offerCategoryId
        self.offerSubcategoryId = offerSubcategoryId
        self.offerCorporateName = offerCorporateName
        self.offerLogoUrl = offerLogoUrl
        self.offerImagesUrl = offerImagesUrl
        self.offerDescription = offerDescription
        self.offerFiscalId = offerFiscalId
        self.offerStreet = offerStreet
        self.offerPostalCode = offerPostalCode
        self.offerArea = offerArea
        self.offerCity = offerCity
        self.offerProvince = offerProvince
        self.offerGpsLat = offerGpsLat
        self.offerGpsLon = offerGpsLon
        self.offerWebURL = offerWebURL
        self.offerMail = offerMail
        self.offerTelephone1 = offerTelephone1
        self.offerOpeningHours = offerOpeningHours
        self.offerRateVisit = offerRateVisit
        self.offerRateHour = offerRateHour
        self.offerRateNotes = offerRateNotes
        self.offerRatingAccumulated = offerRatingAccumulated
        self.offerRatingVotes = offerRatingVotes
        self.offerRaing = offerRaing
        self.offerRegisterDate = offerRegisterDate
    }
}

