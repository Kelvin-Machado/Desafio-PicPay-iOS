//
//  ContactTableViewController.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 03/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class ContactsTableViewController: UITableViewController, UISearchBarDelegate {
    var imageView : UIImageView? = nil
    var contatos: [Contato] = []
    static var searchedContacts = [Contato]()
    
    static var selectedContact = [Contato]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        setupTable()
//        downloadJson()
        
    }
}
