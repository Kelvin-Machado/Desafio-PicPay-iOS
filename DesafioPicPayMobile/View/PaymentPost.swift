//
//  PaymentPost.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 04/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit
import Alamofire

extension PaymentViewController {

    struct PaymentRequest: Encodable {
        var card_number:String!
        var cvv:Int!
        var value:Double!
        var expiry_date:String
        var destination_user_id:Int!
    }
    
    func aproveTransactions() {

        let parameters = PaymentRequest(card_number:"1111111111111111",
                                    cvv:789,
                                    value:79.9,
                                    expiry_date:"01/18",
                                    destination_user_id:1002)
        
        
        AF.request("http://careers.picpay.com/tests/mobdev/transaction", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).response { response in
        debugPrint(response)
        }
        
    }
}
