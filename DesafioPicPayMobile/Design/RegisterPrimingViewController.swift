//
//  RegisterPrimingViewController.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 03/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class RegisterPrimingViewController: UIViewController {
    
    
    var containerView:UIView = {
        let view = UIView()
        return view
    }()
    
    let ccImg = UIImageView()
    let label1 = UILabel()
    let label2 = UILabel()
    let cadastrarBtn = UIButton()
    
    override func viewDidLoad() {
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)

        
        setupNavBar()
        setupPrimingScreen()
        setupRegisterButton()
        
    }
    
    //MARK: - Setup Priming Screen
    func setupPrimingScreen(){
        
        ccImg.image = #imageLiteral(resourceName: "ilustration_creditcard")
        ccImg.contentMode = .scaleAspectFit
        ccImg.clipsToBounds = true
        ccImg.translatesAutoresizingMaskIntoConstraints = false
        
        label1.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.bold)
        label1.textAlignment =  .center
        label1.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label1.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        label1.text = "Cadastre um cartão de crédito"
        label1.numberOfLines = 0
        label1.clipsToBounds = true
        label1.translatesAutoresizingMaskIntoConstraints = false
        
        label2.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        label2.textAlignment =  .center
        label2.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        label2.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        label2.text = "Para fazer pagamentos para outras pessoas você precisa cadastrar um cartão de crédito pessoal"
        label2.numberOfLines = 0
        label2.clipsToBounds = true
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(ccImg)
        containerView.addSubview(label1)
        containerView.addSubview(label2)
        view.addSubview(containerView)
        
        setPrimingScreenConstraints()
    }
    
    func setPrimingScreenConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            
            ccImg.topAnchor.constraint(equalTo: containerView.topAnchor),
            ccImg.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            ccImg.heightAnchor.constraint(equalToConstant: 100),
            ccImg.widthAnchor.constraint(equalToConstant: 150),
            
            label1.topAnchor.constraint(equalTo: ccImg.bottomAnchor, constant: 20),
            label1.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            label1.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20),
            
            label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20),
            label2.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 20),
            label2.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -20)
        ])
    }
    
    //MARK: - Setup Register Button
    func setupRegisterButton() {
        
        cadastrarBtn.titleLabel?.font = UIFont(name:"Helvetica Neue", size: 16)
        cadastrarBtn.backgroundColor = #colorLiteral(red: 0, green: 0.7958126664, blue: 0.3956114948, alpha: 1)
        cadastrarBtn.setTitle("Cadastrar cartão", for: .normal)
        cadastrarBtn.addTarget(self, action: #selector(cadastrarBtnTapped), for: .touchUpInside)
             
        view.addSubview(cadastrarBtn)
        setcadastrarBtnConstraints ()

    }
    
    @objc func cadastrarBtnTapped(){
        let cadastrar = RegisterCCViewController()
        navigationController?.pushViewController(cadastrar, animated: true)
    }
        
    func setcadastrarBtnConstraints() {
        
        cadastrarBtn.translatesAutoresizingMaskIntoConstraints = false
        cadastrarBtn.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            cadastrarBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cadastrarBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cadastrarBtn.heightAnchor.constraint(equalToConstant: 50),
            cadastrarBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40)
        ])
    }
}


