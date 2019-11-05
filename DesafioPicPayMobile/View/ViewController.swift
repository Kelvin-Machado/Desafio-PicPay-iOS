//
//  ViewController.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 03/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import PullToDismissTransition
import UIKit

class ViewController: UIViewController {

    let contactsTable = ContactsTableViewController()
    lazy var searchBarView = UISearchBar()
    static var searching = false
    
    static var creditCardData = CreditCardData()
    static var reciboAppear = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        
        searchBarView.delegate = self
        
        self.addChild(contactsTable)
        view.addSubview(contactsTable.tableView)
        
        setupHeader()
        setupSearchBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        navigationController?.isNavigationBarHidden = true
        searchBarView.text = ""
        ViewController.searching = false
        contactsTable.tableView.reloadData()
        
        RegisterCCViewController().checkForSavedData()
        
        if ViewController.reciboAppear {
            let reciboViewController = MyAwesomeViewController()
            reciboViewController.isPullToDismissEnabled = true

            reciboViewController.modalPresentationCapturesStatusBarAppearance = true
            reciboViewController.modalPresentationStyle = .overFullScreen

            self.present(reciboViewController, animated: true)
        }
        ViewController.reciboAppear = false
    }
    
    func setupHeader() {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Contatos")
        imageView.contentMode = .topLeft
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 300)
        view.addSubview(imageView)
        
        contactsTable.imageView = imageView
    }
    
    func setupSearchBar() {

        searchBarView.placeholder = "A quem você quer pagar?"
        searchBarView.clipsToBounds = true
        searchBarView.keyboardType = .emailAddress
        searchBarView.frame = CGRect(x:  view.bounds.size.width/2 - (view.bounds.size.width/2), y: 86, width: view.frame.width, height: 42)
        searchBarView.backgroundImage = UIColor.init(cgColor: #colorLiteral(red: 0.1675553918, green: 0.1726797223, blue: 0.1854717731, alpha: 1)).image(CGSize(width: 40, height: 40))

        let textFieldInsideSearchBar = searchBarView.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = #colorLiteral(red: 0.9959990382, green: 0.9961215854, blue: 0.9959712625, alpha: 1)
        
        view.addSubview(searchBarView)

    }
        
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}



    //MARK: - Extensions

extension UISearchBar {
    var textField: UITextField? {
        
        return subviews.map { $0.subviews.first(where: { $0 is UITextInputTraits}) as? UITextField }
                .compactMap { $0 }
                .first
    }
}

extension ViewController: UISearchBarDelegate {
    
    func searchBar( _ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""{
            ViewController.searching = false
            contactsTable.tableView.reloadData()
        }else{
            ContactsTableViewController.searchedContacts = contactsTable.contatos.filter {
                $0.name.range(of: searchBar.text!, options: [.caseInsensitive, .diacriticInsensitive]) != nil ||
                $0.username.range(of: searchBar.text!, options: [.caseInsensitive, .diacriticInsensitive]) != nil
            }
            ViewController.searching = true
            contactsTable.tableView.reloadData()
        }
    }
}
