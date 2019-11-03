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
        
        setupHeader()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
        
        contactsTable.tableView.reloadData()
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


}

