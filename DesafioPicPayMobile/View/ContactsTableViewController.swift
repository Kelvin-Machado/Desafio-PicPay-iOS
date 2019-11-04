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
        
        setupTable()
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
    
    
    //MARK: - Setup Table
    func setupTable() {
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        tableView.separatorStyle = .none
        self.tableView.register(ContatosCelula.self, forCellReuseIdentifier: "ContatoCelula")
        tableView.contentInset = UIEdgeInsets(top: 110, left: 0, bottom: 0, right: 0)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if ViewController.searching {
            return ContactsTableViewController.searchedContacts.count
        } else {
            return contatos.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "ContatoCelula", for: indexPath) as! ContatosCelula
        
        celula.backgroundColor =  #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        celula.selectionStyle = .none
        
        if ViewController.searching {
            celula.nameView.text = ContactsTableViewController.searchedContacts[indexPath.row].name
            celula.usernameView.text = ContactsTableViewController.searchedContacts[indexPath.row].username
                
            if let imagemURL = URL(string: ContactsTableViewController.searchedContacts[indexPath.row].img){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imagemURL)
                    if let data = data{
                        let imagem = UIImage(data: data)
                        DispatchQueue.main.async {
                            celula.perfilImgView.image = imagem
                        }
                    }
                }
            }
            
        }else{
            celula.nameView.text = contatos[indexPath.row].name
            celula.usernameView.text = contatos[indexPath.row].username
                
            if let imagemURL = URL(string: contatos[indexPath.row].img){
                DispatchQueue.global().async {
                    let data = try? Data(contentsOf: imagemURL)
                    if let data = data{
                        let imagem = UIImage(data: data)
                        DispatchQueue.main.async {
                            celula.perfilImgView.image = imagem
                        }
                    }
                }
            }
        }
            
        return celula
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 76
    }
    
}

   
//MARK: - Extensions

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            self.setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}



