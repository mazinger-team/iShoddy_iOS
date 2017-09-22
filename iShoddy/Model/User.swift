//
//  Offer.swift
//  iShoddy
//
//  Created by Jose Sanchez Rodriguez on 8/9/17.
//  Copyright © 2017 ESoft. All rights reserved.
//

import Foundation

public class Offer {
    //MARK: Declare
    // Offer properties
    let offer_id: String
    let offer_userId: String
    
    let offer_userName: String
    let user_firstName: String
    var user_secondName: String? = ""
    var user_mail: String? = ""
    let user_username: String
    let user_password: String
    var user_telephone1: String? = ""
    var user_telephone2: String? = ""
    let user_address: [Address]
    
    var user_rate: Double? = 0
    var user_numRates: Int32? = 0
    let user_location: [Location]
    let user_favoriteProfessional: [Int32]
    let user_registerDate: Date
    let user_isProfessional: Bool
    //Professional properties
    var user_professional_corporateName: String? = ""
    let user_professional_address: [Address]?
    let user_professional_fiscalId: String
    var user_prefessional_legalGuardian: String? = ""
    var user_professional_rateProfessional: Double? = 0
    var user_professional_numRatesProfessional: Int32? = 0
    var user_professional_webURL: String? = ""
    var user_professional_logoUrl: String? = ""
    let user_professional_imagesUrl: [String]?
    var user_professional_rateVisit: Double? = 0
    var user_professional_rateHour: Double? = 0
    var user_professional_rateNotes: String? = ""
    var user_professional_ratingAccumulated: Double = 0
    var user_professional_ratingVotes: Double = 0
    var user_professional_raing: Int32 = -1
    let user_professional_registerProfessionalDate: Date?
    
    //MARK: Initialization
    init(offer_id:String, offer_userId: String, user_name: String, user_firstName: String, user_secondName: String, user_mail: String, user_username: String, user_password: String,
         user_telephone1: String, user_telephone2: String, user_address: [Address], user_rate: Double, user_numRates: Int32, user_location: [Location],
         user_favoriteProfessional: [Int32], user_registerDate: Date, user_isProfessional: Bool,
         user_professional_corporateName: String, user_professional_address: [Address], user_professional_fiscalId: String, user_prefessional_legalGuardian: String,
         user_professional_rateProfessional: Double, user_professional_numRatesProfessional: Int32, user_professional_webURL: String,
         user_professional_logoUrl: String, user_professional_imagesUrl:[String], user_professional_rateVisit:Double, user_professional_rateHour:Double,
         user_professional_rateNotes:String, user_professional_ratingAccumulated:Double, user_professional_ratingVotes:Double, user_professional_raing:Int32,
         user_professional_registerProfessionalDate: Date) {
        self.offer_userId = offer_userId
        self.user_name = user_name
        self.user_firstName = user_firstName
        self.user_secondName = user_secondName
        self.user_mail = user_mail
        self.user_username = user_username
        self.user_password = user_password
        self.user_telephone1 = user_telephone1
        self.user_telephone2 = user_telephone2
        self.user_address = user_address
        self.user_rate = user_rate
        self.user_numRates = user_numRates
        self.user_location = user_location
        self.user_favoriteProfessional = user_favoriteProfessional
        self.user_registerDate = user_registerDate
        self.user_isProfessional = user_isProfessional
        self.user_professional_corporateName = user_professional_corporateName
        self.user_professional_address = user_professional_address
        self.user_professional_fiscalId = user_professional_fiscalId
        self.user_prefessional_legalGuardian = user_prefessional_legalGuardian
        self.user_professional_rateProfessional = user_professional_rateProfessional
        self.user_professional_numRatesProfessional = user_professional_numRatesProfessional
        self.user_professional_webURL = user_professional_webURL
        self.user_professional_logoUrl = user_professional_logoUrl
        self.user_professional_imagesUrl = user_professional_imagesUrl
        self.user_professional_rateVisit = user_professional_rateVisit
        self.user_professional_rateHour = user_professional_rateHour
        self.user_professional_rateNotes = user_professional_rateNotes
        self.user_professional_ratingAccumulated = user_professional_ratingAccumulated
        self.user_professional_ratingVotes = user_professional_ratingVotes
        self.user_professional_raing = user_professional_raing
        self.user_professional_registerProfessionalDate = user_professional_registerProfessionalDate
    }
}
