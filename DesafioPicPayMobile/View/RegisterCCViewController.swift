//
//  RegisterCCViewController.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 03/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class RegisterCCViewController: UIViewController, UITextFieldDelegate {
    
//    MARK: - Properties

    lazy var contentViewSize = CGSize(width: view.frame.width, height: view.frame.height + 300)
    let defaults = UserDefaults.standard
    
    
    var editingInfo = [false,false,false,false]
    static var existeCartao = false
    
    fileprivate let keyboardAwareBottomLayoutGuide: UILayoutGuide = UILayoutGuide()
    fileprivate var keyboardTopAnchorConstraint: NSLayoutConstraint!
    
//    MARK: - Views
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        view.frame.size = contentViewSize
        return view
    }()
    
    var numCCLbl = UILabel()
    var numCC = UITextField()
    
    var holderName = UITextField()
    var holderNameLbl = UILabel()
    
    var expirationDate = UITextField()
    var expirationDateLbl = UILabel()

    var cvv = UITextField()
    var cvvLbl = UILabel()
    
    let cadastroLabel = UILabel()
    let saveBtn = UIButton()
    

//    MARK: - life cycle
    
    override func viewDidLoad() {
        
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)

        setupKeyboard()
        setupNavBar()
        setupHeader()
        setupDesign()
        checkForSavedData()
        setupSaveButton()
        
    }


    
    //MARK: - Setup Save Button
    func setupSaveButton(){
        saveBtn.titleLabel?.font = UIFont(name:"Helvetica Neue", size: 16)
        saveBtn.backgroundColor = #colorLiteral(red: 0, green: 0.7958126664, blue: 0.3956114948, alpha: 1)
        saveBtn.setTitle("Salvar", for: .normal)
        saveBtn.addTarget(self, action: #selector(saveBtnTapped), for: .touchUpInside)
             
        view.addSubview(saveBtn)
        setsaveBtnConstraints ()
    }
    @objc func saveBtnTapped(){
        
        let salvar = PaymentViewController()
        
        saveData()
        navigationController?.pushViewController(salvar, animated: true)
    }

    func  setsaveBtnConstraints() {
        
        saveBtn.translatesAutoresizingMaskIntoConstraints = false
        saveBtn.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            saveBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveBtn.heightAnchor.constraint(equalToConstant: 50),
            saveBtn.bottomAnchor.constraint(equalTo: keyboardAwareBottomLayoutGuide.topAnchor, constant: -20)
        ])
        
    }
    
    //MARK: - Setup keyboard
     func setupKeyboard(){
         self.view.addLayoutGuide(self.keyboardAwareBottomLayoutGuide)
         self.keyboardTopAnchorConstraint = self.view.layoutMarginsGuide.bottomAnchor.constraint(equalTo: keyboardAwareBottomLayoutGuide.topAnchor, constant: 0)
         self.keyboardTopAnchorConstraint.isActive = true
         self.keyboardAwareBottomLayoutGuide.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
         
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
     }
     
     @objc func keyboardWillShow(notification: NSNotification) {
         updateKeyboardAwareBottomLayoutGuide(with: notification, hiding: false)
     }

     @objc func keyboardWillHide(notification: NSNotification) {
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
}
