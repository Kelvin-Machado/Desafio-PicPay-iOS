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
            switch response.result {
            case .success:
                let status = "Aprovada"
                let dados = response.self.debugDescription
                print(dados)
                
                if dados.contains(status){
                    let recibo = ViewController()
                    ViewController.reciboAppear = true
                    self.navigationController?.pushViewController(recibo, animated: true)
                }else{
                    self.showAlert()
                }

            case .failure:
                print("Erro")
            }

        }

    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Oops!!!!", message: " Ocorreu um erro! \n Por favor, verifique os dados do Cartão de Crédito", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
              switch action.style{
              case .default:
                    print("default")

              case .cancel:
                    print("cancel")

              case .destructive:
                    print("destructive")


        }}))
        self.present(alert, animated: true, completion: nil)
        
        let recibo = ViewController()
        ViewController.reciboAppear = false
        self.navigationController?.pushViewController(recibo, animated: true)
    }
    
}

//struct APIRequest {
//    let resourceURL: URL
//
//    let parameters = PaymentViewController.PaymentRequest(card_number:ViewController.creditCardRaw.cardNumb,
//        cvv:ViewController.creditCardData.cvv,
//    value:PaymentViewController.amountP,
//    expiry_date:ViewController.creditCardData.expiryDate,
//    destination_user_id:PaymentViewController.contactP.id)
//
//    init(endpoint: String) {
//        let resourceString = "http://careers.picpay.com/tests/mobdev/transaction\(endpoint)"
//        guard let resourceURL = URL(string: resourceString) else {fatalError()}
//        self.resourceURL = resourceURL
//    }
//
//    func save ( messageToSave:TransactionResponse, completion: @escaping(Result<TransactionResponse, APIError>) -> Void){
//        do {
//            var urlRequest = URLRequest(url: resourceURL)
//            urlRequest.httpMethod = "POST"
//            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
//            urlRequest.httpBody = try JSONEncoder().encode(parameters)
//
//            let dataTask = URLSession.shared.dataTask(with: urlRequest) {data, response,_ in
//
//                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
//                    let jsonData = data else {
//                        completion(.failure(.responseProblem))
//                        return
//                }
//                do {
//                    let transactionData = try JSONDecoder().decode(TransactionResponse.self, from: jsonData)
//                    completion(.success(transactionData))
//                }catch{
//                    completion(.failure(.decodingProblem))
//                }
//            }
//            dataTask.resume()
//
//        }catch{
//            completion(.failure(.encodingProblem))
//        }
//    }
//}

