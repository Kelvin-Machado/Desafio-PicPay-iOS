//
//  CreditCardData.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 04/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import Foundation

struct Keys {
    static let card_number  = "card_number"
    static let card_number_raw  = "card_number_raw"
    static let cvv = "cvv"
    static let expiry_date  = "expiry_date"
    static let expiry_date_raw  = "expiry_date_raw"
    static let holder_name = "holder_name"
}


struct CreditCardData {
    var cardNumb: String!
    var cvv:Int!
    var expiryDate:String!
}


