//
//  PaymentViewController.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 03/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController, UITextFieldDelegate {
    
    static var contactP = Contato()
    static var ccNameP = ""
    static var amountP = 0.0
    static var amountFormated = ""
    
    var containerView:UIView = {
        let view = UIView()
        return view
    }()
    
    var containerAmount:UIView = {
        let view = UIView()
        return view
    }()
    
    var containerCC:UIView = {
        let view = UIView()
        return view
    }()
    
    var passedAmount: Double!
    
    var perfilImg =  UIImageView()
    var username = UILabel()
    
    let dollar = UILabel()
    var amount = UITextField()
    
    var ccName = UILabel()
    let editBtn = UIButton()
    
    let payButton = UIButton()
    
    let keyboardAwareBottomLayoutGuide: UILayoutGuide = UILayoutGuide()
    var keyboardTopAnchorConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        
        setupKeyboard()
        setupNavBar()
        setupContactInfo()
        setupAmount()
        setupCCInfo()
        setupPayButton()
        setPayButtonConstraints()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        amount.becomeFirstResponder()
    }

    
    //MARK: - Keyboard Events
    
    func setupKeyboard() {
        self.view.addLayoutGuide(self.keyboardAwareBottomLayoutGuide)
        
        self.keyboardTopAnchorConstraint = self.view.layoutMarginsGuide.bottomAnchor.constraint(equalTo: keyboardAwareBottomLayoutGuide.topAnchor, constant: 0)
        self.keyboardTopAnchorConstraint.isActive = true
        self.keyboardAwareBottomLayoutGuide.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        dollar.textColor = #colorLiteral(red: 0, green: 0.7958126664, blue: 0.3956114948, alpha: 1)
        payButton.backgroundColor = #colorLiteral(red: 0, green: 0.7958126664, blue: 0.3956114948, alpha: 1)
        amount.attributedPlaceholder = NSAttributedString(string: "0,00",
                    attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0, green: 0.7958126664, blue: 0.3956114948, alpha: 1)])
        
        updateKeyboardAwareBottomLayoutGuide(with: notification, hiding: false)
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        dollar.textColor = #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)
        payButton.backgroundColor = #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)
        amount.attributedPlaceholder = NSAttributedString(string: "0,00",
        attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.5575397611, green: 0.5729063153, blue: 0.6198518276, alpha: 1)])

         updateKeyboardAwareBottomLayoutGuide(with: notification, hiding: true)
        }
    
    fileprivate func updateKeyboardAwareBottomLayoutGuide(with notification: NSNotification, hiding: Bool) {
        let userInfo = notification.userInfo

        let animationDuration = (userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue
        let keyboardEndFrame = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue

        let rawAnimationCurve = (userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber)?.uint32Value

        guard let animDuration = animationDuration,
            let keybrdEndFrame = keyboardEndFrame,
            let rawAnimCurve = rawAnimationCurve else {
                return
        }

        let convertedKeyboardEndFrame = view.convert(keybrdEndFrame, from: view.window)

        let rawAnimCurveAdjusted = UInt(rawAnimCurve << 16)
        let animationCurve = UIView.AnimationOptions(rawValue: rawAnimCurveAdjusted)

        self.keyboardTopAnchorConstraint.constant = hiding ? 0 : convertedKeyboardEndFrame.size.height

        self.view.setNeedsLayout()

        UIView.animate(withDuration: animDuration, delay: 0.0, options: [.beginFromCurrentState, animationCurve], animations: {
            self.view.layoutIfNeeded()
        }, completion: { success in
            //
        })
    }
    
    //MARK: - more settings

    override var preferredStatusBarStyle: UIStatusBarStyle {
      return .lightContent
    }

}


