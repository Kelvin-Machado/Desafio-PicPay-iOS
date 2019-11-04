//
//  ReciboViewController.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 04/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class ReciboViewController: UIViewController {
    
    
//    MARK: - Views
    var containerView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        return view
    }()
    
    var containerUserView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        return view
    }()
    var containerPaidView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        return view
    }()
    
    let headerLbl = UILabel()
    let perfilImg = UIImageView()
    let usernameLbl = UILabel()
    let dateLbl = UILabel()
    let transactionLbl = UILabel()
    let ccNameLbl = UILabel()
    let ccValorLbl = UILabel()
    let totalLbl = UILabel()
    let totalValorLbl = UILabel()
    
    
//    MARK: - Life Cycle
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        
        
        view.addSubview(containerView)
        
        setupContainerConstraints()
        setupHeader()
        setupContactInfo()
        setupValorInfo()
        
    }
    
//    MARK: - Setup Container
    
    func setupContainerConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        containerView.topAnchor.constraint(equalTo: view.topAnchor),
        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
//    MARK: - Setup Header
        
    func setupHeader() {
        headerLbl.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        headerLbl.textAlignment =  .center
        headerLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        headerLbl.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        headerLbl.text = "Recibo"
        headerLbl.clipsToBounds = true
        
        containerView.addSubview(headerLbl)
        setupHeaderConstraints()
    }
    
    func setupHeaderConstraints() {
        headerLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        headerLbl.topAnchor.constraint(equalTo: containerView.topAnchor),
        headerLbl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        headerLbl.widthAnchor.constraint(equalToConstant: view.frame.width),
        headerLbl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
 
//    MARK: - Setup contact info
    func setupContactInfo(){
        
        if let image = getImage(from: PaymentViewController.contactP.img) {
            perfilImg.image = image
        }
        perfilImg.layer.cornerRadius = 45
        perfilImg.clipsToBounds = true
        
        usernameLbl.font = UIFont.init(name: "Helvetica Neue", size: 18)
        usernameLbl.textColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        usernameLbl.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        usernameLbl.textAlignment = .center
        usernameLbl.text = PaymentViewController.contactP.username
        
        dateLbl.font = UIFont.init(name: "Helvetica Neue", size: 16)
        dateLbl.textColor = #colorLiteral(red: 0.6391510367, green: 0.6392295957, blue: 0.64344877, alpha: 1)
        dateLbl.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        dateLbl.textAlignment = .center
        dateLbl.text = getDate()
        
        transactionLbl.font = UIFont.init(name: "Helvetica Neue", size: 14)
        transactionLbl.textColor = #colorLiteral(red: 0.6391510367, green: 0.6392295957, blue: 0.64344877, alpha: 1)
        transactionLbl.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        transactionLbl.textAlignment = .center
        transactionLbl.text = "230010"
            
        containerUserView.addSubview(perfilImg)
        containerUserView.addSubview(usernameLbl)
        containerUserView.addSubview(dateLbl)
        containerUserView.addSubview(transactionLbl)
        containerView.addSubview(containerUserView)
        
        setContactInfoConstraints()
    }
    
    func setContactInfoConstraints() {
        
        containerUserView.translatesAutoresizingMaskIntoConstraints = false
        perfilImg.translatesAutoresizingMaskIntoConstraints = false
        usernameLbl.translatesAutoresizingMaskIntoConstraints = false
        dateLbl.translatesAutoresizingMaskIntoConstraints = false
        transactionLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerUserView.topAnchor.constraint(equalTo: headerLbl.bottomAnchor, constant: 20),
            containerUserView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            perfilImg.topAnchor.constraint(equalTo: containerUserView.topAnchor),
            perfilImg.centerXAnchor.constraint(equalTo: containerUserView.centerXAnchor),
            perfilImg.heightAnchor.constraint(equalToConstant: 90),
            perfilImg.widthAnchor.constraint(equalToConstant: 90),
            
            usernameLbl.topAnchor.constraint(equalTo: perfilImg.bottomAnchor, constant: 10),
            usernameLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            usernameLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
                
            dateLbl.topAnchor.constraint(equalTo: usernameLbl.bottomAnchor, constant: 10),
            dateLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            dateLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            transactionLbl.topAnchor.constraint(equalTo: dateLbl.bottomAnchor, constant: 10),
            transactionLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            transactionLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
            
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
    
    func getDate() -> String {
        
        
        let date = Date()
        let calendar = Calendar.current
        
        let day = calendar.component(.day, from: date)
        let mounth = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        return ("\(day)/\(mounth)/\(year)  às  \(hour):\(minute)")
    }
    
//    MARK: - Setup valor info
    func setupValorInfo() {
        
        ccNameLbl.text = PaymentViewController.ccNameP
        ccNameLbl.font = UIFont(name:"Helvetica Neue", size: 14)
        ccNameLbl.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        ccNameLbl.textColor = #colorLiteral(red: 0.6391510367, green: 0.6392295957, blue: 0.64344877, alpha: 1)
        ccNameLbl.clipsToBounds = true
        ccNameLbl.addLine(position: .LINE_POSITION_TOP, color: #colorLiteral(red: 0.6391510367, green: 0.6392295957, blue: 0.64344877, alpha: 1), width: 1.0)
        
        ccValorLbl.text = String("R$ \(PaymentViewController.amountP)")
        ccValorLbl.font = UIFont(name:"Helvetica Neue", size: 14)
        ccValorLbl.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        ccValorLbl.textAlignment = .right
        ccValorLbl.textColor = #colorLiteral(red: 0.6391510367, green: 0.6392295957, blue: 0.64344877, alpha: 1)
        ccValorLbl.clipsToBounds = true
        ccValorLbl.addLine(position: .LINE_POSITION_TOP, color: #colorLiteral(red: 0.6391510367, green: 0.6392295957, blue: 0.64344877, alpha: 1), width: 1.0)
        
        totalLbl.text = "Total pago"
        totalLbl.font = UIFont(name:"Helvetica Neue-Bold", size: 16)
        totalLbl.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        totalLbl.textColor = #colorLiteral(red: 0.6391510367, green: 0.6392295957, blue: 0.64344877, alpha: 1)
        totalLbl.clipsToBounds = true
        totalLbl.addLine(position: .LINE_POSITION_TOP, color: #colorLiteral(red: 0.6391510367, green: 0.6392295957, blue: 0.64344877, alpha: 1), width: 1.0)
        
        totalValorLbl.text = String("R$ \(PaymentViewController.amountP)")
        totalValorLbl.font = UIFont(name:"Helvetica Neue-Bold", size: 16)
        totalValorLbl.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        totalValorLbl.textColor = #colorLiteral(red: 0.6391510367, green: 0.6392295957, blue: 0.64344877, alpha: 1)
        totalValorLbl.textAlignment = .right
        totalValorLbl.clipsToBounds = true
        totalValorLbl.addLine(position: .LINE_POSITION_TOP, color: #colorLiteral(red: 0.6391510367, green: 0.6392295957, blue: 0.64344877, alpha: 1), width: 1.0)
        
        containerPaidView.addSubview(ccNameLbl)
        containerPaidView.addSubview(ccValorLbl)
        containerPaidView.addSubview(totalLbl)
        containerPaidView.addSubview(totalValorLbl)
        view.addSubview(containerPaidView)
         
        setValorInfoConstraints()
    }
    
    func setValorInfoConstraints() {
        containerPaidView.translatesAutoresizingMaskIntoConstraints = false
        ccNameLbl.translatesAutoresizingMaskIntoConstraints = false
        ccValorLbl.translatesAutoresizingMaskIntoConstraints = false
        totalLbl.translatesAutoresizingMaskIntoConstraints = false
        totalValorLbl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerPaidView.topAnchor.constraint(equalTo: transactionLbl.bottomAnchor, constant: 40),
            containerPaidView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            ccNameLbl.topAnchor.constraint(equalTo: containerPaidView.topAnchor, constant: 20),
            ccNameLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            ccNameLbl.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            
            ccValorLbl.topAnchor.constraint(equalTo: containerPaidView.topAnchor, constant: 20),
            ccValorLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            ccValorLbl.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
                
            totalLbl.topAnchor.constraint(equalTo: ccNameLbl.bottomAnchor, constant: 30),
            totalLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            totalLbl.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20),
            
            totalValorLbl.topAnchor.constraint(equalTo: ccValorLbl.bottomAnchor, constant: 30),
            totalValorLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            totalValorLbl.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 20)
        ])
    }

}

