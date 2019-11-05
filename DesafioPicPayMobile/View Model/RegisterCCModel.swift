//
//  RegisterCCModel.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 05/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

extension RegisterCCViewController {
    
    
    
    //MARK: - Setup Header
    func setupHeader() {
        cadastroLabel.text = "Cadastrar cartão"
        cadastroLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 35)
        cadastroLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cadastroLabel.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        cadastroLabel.clipsToBounds = true
        
        containerView.addSubview(cadastroLabel)
        
        setupHeaderConstaints()
    }
    
    func setupHeaderConstaints() {
        
        cadastroLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate ([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor),

            cadastroLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            cadastroLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20)
        ])
    }
    
    //MARK: - Setup Design
    
    func setupDesign(){
        setupNumCC()
        setupHolderName()
        setupExpirationDate()
        setupCVV()
    }
    
    func setupNumCC(){
        
        numCCLbl.font = UIFont(name:"HelveticaNeue-Bold", size: 16)
        numCCLbl.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        numCCLbl.clipsToBounds = true
        numCCLbl.text = "Número do cartão"
        numCCLbl.textColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        
        numCC.delegate = self
        numCC.keyboardType = .decimalPad
        numCC.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
        numCC.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        numCC.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        numCC.attributedPlaceholder = NSAttributedString(string: "Número do cartão",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)])

        numCC.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1), width: 1.0)

        
        containerView.addSubview(numCCLbl)
        containerView.addSubview(numCC)
        setupNumCCConstraints()
    }
    
    func setupNumCCConstraints() {
                
        numCCLbl.translatesAutoresizingMaskIntoConstraints = false
        numCC.translatesAutoresizingMaskIntoConstraints = false
        

        NSLayoutConstraint.activate([
            numCCLbl.topAnchor.constraint(equalTo: cadastroLabel.bottomAnchor, constant: 40),
            numCCLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            numCC.topAnchor.constraint(equalTo: numCCLbl.bottomAnchor, constant: 10),
            numCC.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            numCC.widthAnchor.constraint(equalToConstant: containerView.frame.width - 40)
        ])
    }
    
    func setupHolderName() {
        holderNameLbl.font = UIFont(name:"HelveticaNeue-Bold", size: 16)
        holderNameLbl.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        holderNameLbl.clipsToBounds = true
        holderNameLbl.text = "Nome do titular"
        holderNameLbl.textColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        
        holderName.delegate = self
        holderName.keyboardType = .namePhonePad
        holderName.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
        holderName.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        holderName.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        holderName.attributedPlaceholder = NSAttributedString(string: "Nome do titular",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)])

        holderName.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1), width: 1.0)

        
        containerView.addSubview(holderNameLbl)
        containerView.addSubview(holderName)
        setupHolderNameConstraints()
    }
    
    func setupHolderNameConstraints() {
        holderNameLbl.translatesAutoresizingMaskIntoConstraints = false
        holderName.translatesAutoresizingMaskIntoConstraints = false
       
        NSLayoutConstraint.activate([
            holderNameLbl.topAnchor.constraint(equalTo: numCC.bottomAnchor, constant: 40),
            holderNameLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            
            holderName.topAnchor.constraint(equalTo: holderNameLbl.bottomAnchor, constant: 10),
            holderName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            holderName.widthAnchor.constraint(equalToConstant: containerView.frame.width - 40)
        ])
    }
    
    func setupExpirationDate() {

        expirationDateLbl.font = UIFont(name:"HelveticaNeue-Bold", size: 16)
        expirationDateLbl.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        expirationDateLbl.clipsToBounds = true
        expirationDateLbl.text = "Vencimento"
        expirationDateLbl.textColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        
        expirationDate.delegate = self
        expirationDate.keyboardType = .decimalPad
        expirationDate.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
        expirationDate.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        expirationDate.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        expirationDate.attributedPlaceholder = NSAttributedString(string: "Vencimento",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)])

        expirationDate.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1), width: 1.0)

        
        containerView.addSubview(expirationDateLbl)
        containerView.addSubview(expirationDate)
        setupExpirationDateConstraints()
    }
    
    func setupExpirationDateConstraints() {
        
        expirationDateLbl.translatesAutoresizingMaskIntoConstraints = false
        expirationDate.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            expirationDateLbl.topAnchor.constraint(equalTo: holderName.bottomAnchor, constant: 40),
            expirationDateLbl.leadingAnchor.constraint(equalTo: expirationDate.leadingAnchor),
            
            expirationDate.topAnchor.constraint(equalTo: expirationDateLbl.bottomAnchor, constant: 10),
            expirationDate.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            expirationDate.widthAnchor.constraint(equalToConstant: (containerView.frame.width/2) - 40)
        ])
    }
    
    func setupCVV() {
        cvvLbl.font = UIFont(name:"HelveticaNeue-Bold", size: 16)
        cvvLbl.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        cvvLbl.clipsToBounds = true
        cvvLbl.text = "CVV"
        cvvLbl.textColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        
        cvv.delegate = self
        cvv.keyboardType = .decimalPad
        cvv.font = UIFont(name:"HelveticaNeue-Bold", size: 18)
        cvv.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        cvv.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        cvv.attributedPlaceholder = NSAttributedString(string: "CVV",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)])

        cvv.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1), width: 1.0)

        
        containerView.addSubview(cvvLbl)
        containerView.addSubview(cvv)
        setupCVVConstraints()
    }
    func setupCVVConstraints() {
        cvvLbl.translatesAutoresizingMaskIntoConstraints = false
        cvv.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cvvLbl.topAnchor.constraint(equalTo: holderName.bottomAnchor, constant: 40),
            cvvLbl.leadingAnchor.constraint(equalTo: cvv.leadingAnchor),
                        
            cvv.topAnchor.constraint(equalTo: cvvLbl.bottomAnchor, constant: 10),
            cvv.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            cvv.widthAnchor.constraint(equalToConstant: (containerView.frame.width/2) - 40)
        ])
        
    }
    
    internal func textFieldDidBeginEditing(_ textField: UITextField) {
        
        if numCC.isEditing {
            editingInfo[0] = true
            numCCLbl.text = "Número do cartão"
            numCCLbl.textColor = #colorLiteral(red: 0.01031207293, green: 0.7971442342, blue: 0.3966989219, alpha: 1)
            numCC.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.01031207293, green: 0.7971442342, blue: 0.3966989219, alpha: 1), width: 1.0)
           numCC.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1) ])
        }
        
        if holderName.isEditing {
            editingInfo[1] = true
            holderNameLbl.text = "Nome do titular"
            holderNameLbl.textColor = #colorLiteral(red: 0.01031207293, green: 0.7971442342, blue: 0.3966989219, alpha: 1)
            holderName.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.01031207293, green: 0.7971442342, blue: 0.3966989219, alpha: 1), width: 1.0)
            holderName.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1) ])
        }
        
        if expirationDate.isEditing {
            editingInfo[2] = true
            expirationDateLbl.text = "Vencimento"
            expirationDateLbl.textColor = #colorLiteral(red: 0.01031207293, green: 0.7971442342, blue: 0.3966989219, alpha: 1)
            expirationDate.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.01031207293, green: 0.7971442342, blue: 0.3966989219, alpha: 1), width: 1.0)
           expirationDate.attributedPlaceholder = NSAttributedString(string: "MM/AA", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1) ])
        }
        
        if cvv.isEditing {
            editingInfo[3] = true
            cvvLbl.text = "CVV"
            cvvLbl.textColor = #colorLiteral(red: 0.01031207293, green: 0.7971442342, blue: 0.3966989219, alpha: 1)
            cvv.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.01031207293, green: 0.7971442342, blue: 0.3966989219, alpha: 1), width: 1.0)
           cvv.attributedPlaceholder = NSAttributedString(string: "", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1) ])
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if editingInfo[0] {
            numCCLbl.textColor = #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)
            numCC.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1), width: 1.0)
            editingInfo[0] = false
        }
        if editingInfo[1] {
            holderNameLbl.textColor = #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)
            holderName.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1), width: 1.0)
            editingInfo[1] = false
        }
        if editingInfo[2] {
            expirationDateLbl.textColor = #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)
            expirationDate.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1), width: 1.0)
            editingInfo[2] = false
        }
        if editingInfo[3] {
            cvvLbl.textColor = #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)
            cvv.addLine(position: .LINE_POSITION_BOTTOM, color: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1), width: 1.0)
            editingInfo[3] = false
        }
    }
}
