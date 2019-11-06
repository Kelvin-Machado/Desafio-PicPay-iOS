//
//  PaymentViewModel.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 05/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

extension PaymentViewController {
    // MARK: - Setup Contact Info

    func setupContactInfo(){
        
        if let image = getImage(from: PaymentViewController.contactP.img) {
            perfilImg.image = image
        }

        perfilImg.layer.cornerRadius = 45
        perfilImg.clipsToBounds = true
        
        username.font = UIFont.init(name: "Helvetica Neue", size: 18)
        username.textColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        username.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        username.numberOfLines = 0
        username.textAlignment = .center
        username.text = PaymentViewController.contactP.username
        
        containerView.addSubview(perfilImg)
        containerView.addSubview(username)
        view.addSubview(containerView)
        
        setContactInfoConstraints()
    }

    func  setContactInfoConstraints(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        perfilImg.translatesAutoresizingMaskIntoConstraints = false
        username.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            perfilImg.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            perfilImg.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            perfilImg.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            perfilImg.heightAnchor.constraint(equalToConstant: 90),
            perfilImg.widthAnchor.constraint(equalToConstant: 90),
            
            username.topAnchor.constraint(equalTo: perfilImg.bottomAnchor, constant: 10),
            username.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            username.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20)
        ])
    }

        func getImage(from string: String) -> UIImage? {

            guard let url = URL(string: string)
                else {
                    print("Unable to create URL")
                    return nil
            }

            var image: UIImage? = nil
            do {
                let data = try Data(contentsOf: url, options: [])
                image = UIImage(data: data)
            }
            catch {
                print(error.localizedDescription)
            }

            return image
        }

    //MARK: - Setup Amount

    func setupAmount(){
        
        dollar.text = "R$"
        dollar.font = UIFont(name:"HelveticaNeue-Light", size: 20)
        dollar.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        dollar.clipsToBounds = true
        dollar.textColor = #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)
        
        amount.keyboardType = .decimalPad
        amount.font = UIFont(name:"HelveticaNeue-Light", size: 80)
        amount.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        amount.textColor = #colorLiteral(red: 0, green: 0.7958126664, blue: 0.3956114948, alpha: 1)
        amount.attributedPlaceholder = NSAttributedString(string: "0,00",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)])
        
        amount.clipsToBounds = true
        
        containerAmount.addSubview(dollar)
        containerAmount.addSubview(amount)
        view.addSubview(containerAmount)
        
        
        setAmountConstraints()
    }

    func setAmountConstraints(){
        containerAmount.translatesAutoresizingMaskIntoConstraints = false
        dollar.translatesAutoresizingMaskIntoConstraints = false
        amount.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            containerAmount.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 50),
            containerAmount.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            dollar.centerYAnchor.constraint(equalTo: containerAmount.centerYAnchor, constant: 40),
            dollar.rightAnchor.constraint(equalTo: amount.leftAnchor, constant: -5),
            
            amount.centerYAnchor.constraint(equalTo: containerAmount.centerYAnchor, constant: 40),
            amount.centerXAnchor.constraint(equalTo: containerAmount.centerXAnchor, constant: containerAmount.frame.width/2)
        ])
    }

    //MARK: - Setup Credit Card Info

    func setupCCInfo(){
        
        ccName.text = "Mastercard 1234 ● "
        PaymentViewController.ccNameP = "Mastercard 1234" //O nome da bandeira deveria ser preenchido através de um método
        ccName.font = UIFont(name:"Helvetica Neue", size: 14)
        ccName.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        ccName.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        ccName.clipsToBounds = true
        
        editBtn.clipsToBounds = true
        editBtn.titleLabel?.font = UIFont(name:"Helvetica Neue", size: 16)
        editBtn.titleLabel?.textColor = #colorLiteral(red: 0, green: 0.7958126664, blue: 0.3956114948, alpha: 1)
        editBtn.setTitleColor( #colorLiteral(red: 0, green: 0.7958126664, blue: 0.3956114948, alpha: 1), for: UIControl.State.normal)
        editBtn.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        editBtn.setTitle("EDITAR", for: .normal)
        
        editBtn.addTarget(self, action: #selector(editBtnTapped), for: .touchUpInside)
        
        containerCC.addSubview(ccName)
        containerCC.addSubview(editBtn)
        view.addSubview(containerCC)
        
        setCCConstraints()
    }
    @objc func editBtnTapped(){
        let editar = RegisterCCViewController()
        navigationController?.pushViewController(editar, animated: true)
    }
    func  setCCConstraints() {
        ccName.translatesAutoresizingMaskIntoConstraints = false
        editBtn.translatesAutoresizingMaskIntoConstraints = false
        containerCC.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            containerCC.topAnchor.constraint(equalTo: containerAmount.bottomAnchor, constant: 100),
            containerCC.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerCC.widthAnchor.constraint(equalToConstant: view.frame.width),
            containerCC.heightAnchor.constraint(equalTo: editBtn.heightAnchor),
            
            
            ccName.centerXAnchor.constraint(equalTo: containerCC.centerXAnchor, constant: -45),
            ccName.centerYAnchor.constraint(equalTo: containerCC.centerYAnchor),
            
            editBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 45),
            editBtn.centerYAnchor.constraint(equalTo: containerCC.centerYAnchor)
        ])
    }

    //MARK: - Setup Pay Button

    func setupPayButton(){
        payButton.titleLabel?.font = UIFont(name:"Helvetica Neue", size: 16)
        payButton.backgroundColor = #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)
        payButton.setTitle("Pagar", for: .normal)

        payButton.addTarget(self, action: #selector(payButtonTapped), for: .touchUpInside)
         
        view.addSubview(payButton)
    }

    @objc func payButtonTapped(){

        if let text = amount.text {
            PaymentViewController.amountP = Double(text) ?? 0.0
        }

        aproveTransactions()

        
    }

    func setPayButtonConstraints() {
        
        payButton.translatesAutoresizingMaskIntoConstraints = false
        payButton.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            payButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            payButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            payButton.heightAnchor.constraint(equalToConstant: 50),
            payButton.bottomAnchor.constraint(equalTo: keyboardAwareBottomLayoutGuide.topAnchor, constant: -20)
        ])

    }
}
