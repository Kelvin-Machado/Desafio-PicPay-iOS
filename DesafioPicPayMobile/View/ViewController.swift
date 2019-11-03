//
//  ViewController.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 03/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let contactsTable = ContactsTableViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        
        self.addChild(contactsTable)
        view.addSubview(contactsTable.tableView)
    }


}

