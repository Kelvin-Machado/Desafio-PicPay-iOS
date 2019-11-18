//
//  Transaction.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 05/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import Foundation

enum APIError:Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
}

//struct TransactionResponse: Codable {
//    
//    struct destinationUser: Codable {
//        var id:Int
//        var name:String
//        var img:String
//        var username:String
//    }
//
//    struct transaction: Codable{
//        var id:Int
//        var timestamp:Int
//        var value:Double
//        var destination_user:destinationUser
//        var success:Bool
//        var status:String
//    
//
//    }
//
//}

