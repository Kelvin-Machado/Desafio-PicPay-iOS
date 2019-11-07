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

        let parameters = PaymentRequest(card_number:ViewController.creditCardRaw.cardNumb,
                                        cvv:ViewController.creditCardData.cvv,
                                    value:PaymentViewController.amountP,
                                    expiry_date:ViewController.creditCardData.expiryDate,
                                    destination_user_id:PaymentViewController.contactP.id)
        
        
        AF.request("http://careers.picpay.com/tests/mobdev/transaction", method: .post, parameters: parameters, encoder: JSONParameterEncoder.default).response { response in
            let imprimir:String = (response.debugDescription)
            print(imprimir)
            switch response.result {
            case .success:
                debugPrint(response)
                
            

               
                let recibo = ViewController()
                ViewController.reciboAppear = true
               self.navigationController?.pushViewController(recibo, animated: true)
               
            case .failure:
                print("Erro")
            }
        
        }
        
    }
}

