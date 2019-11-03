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
        downloadJson()
        
    }
    
    
    // MARK: - Download JSON
    
    func downloadJson() {
        let contatosString = "http://careers.picpay.com/tests/mobdev/users"
        guard let url = URL(string: contatosString) else { return }

        URLSession.shared.dataTask(with: url) { (data, response, err) in

            guard let data = data else { return }

            do {
                let contatosBaixados = try
                    JSONDecoder().decode([Contato].self, from: data)
                self.contatos = contatosBaixados
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let jsonError {
                print("Error serializing json:", jsonError)
            }
        }.resume()
    }
}
