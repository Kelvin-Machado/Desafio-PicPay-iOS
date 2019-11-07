//
//  RegisterCCViewControllerEXData.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 03/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

extension RegisterCCViewController {
    
    // Save Data
    func saveData() {
        defaults.set(numCC.text!, forKey: Keys.card_number)
        defaults.set(ViewController.creditCardRaw.cardNumb, forKey: Keys.card_number_raw)
        defaults.set(holderName.text!, forKey: Keys.holder_name)
        defaults.set(expirationDate.text!, forKey: Keys.expiry_date)
        defaults.set(ViewController.creditCardRaw.expiryDate, forKey: Keys.expiry_date_raw)
        defaults.set(cvv.text!, forKey: Keys.cvv)
        RegisterCCViewController.existeCartao = true
        passDataToCC()
    }

    // Check Save Data
     func checkForSavedData() {
        let card_number = defaults.value(forKey: Keys.card_number) as? String ?? ""
        numCC.text = card_number
        let holder_name = defaults.value(forKey: Keys.holder_name) as? String ?? ""
        holderName.text = holder_name
        let expiry_date = defaults.value(forKey: Keys.expiry_date) as? String ?? ""
        expirationDate.text = expiry_date
        let checkCvv = defaults.integer(forKey: Keys.cvv)
        cvv.text = String(checkCvv)
        passDataToCC()
        
        RegisterCCViewController.existeCartao = true
        
        if  numCC.text == "" || holderName.text == "" || expiry_date == "" || cvv.text == "" {
            RegisterCCViewController.existeCartao = false
        }
    }
    
    func passDataToCC(){
        ViewController.creditCardData.cardNumb = defaults.value(forKey: Keys.card_number) as? String ?? ""
        ViewController.creditCardData.cvv = defaults.integer(forKey: Keys.cvv)
        ViewController.creditCardData.expiryDate = defaults.value(forKey: Keys.expiry_date) as? String ?? "00/00"
        
        ViewController.creditCardRaw.cardNumb = defaults.value(forKey: Keys.card_number_raw) as? String ?? ""
    }

}
