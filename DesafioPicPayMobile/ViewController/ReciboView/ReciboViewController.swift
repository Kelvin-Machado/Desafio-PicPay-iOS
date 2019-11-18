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

}

