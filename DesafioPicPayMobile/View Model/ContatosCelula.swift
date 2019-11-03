//
//  ContatosCelula.swift
//  DesafioPicPayMobile
//
//  Created by Kelvin Batista Machado on 03/11/19.
//  Copyright © 2019 Kelvin Batista Machado. All rights reserved.
//

import UIKit

class ContatosCelula: UITableViewCell {
    
//    MARK: - Views
    
    var perfilImg: UIImage?
    var username: UILabel?
    var name: UILabel?
    
    var containerView:UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        return view
    }()
    
    var nameView: UILabel = {
        var nameLabel = UILabel()
        nameLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.light)
        nameLabel.textColor = #colorLiteral(red: 0.5568059087, green: 0.5569027066, blue: 0.5610976815, alpha: 1)
        nameLabel.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        nameLabel.clipsToBounds = true
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameLabel
    }()
    
    var usernameView: UILabel = {
       var usernameLabel = UILabel()
        usernameLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
        usernameLabel.textColor = #colorLiteral(red: 0.9999071956, green: 1, blue: 0.999881804, alpha: 1)
        usernameLabel.backgroundColor = #colorLiteral(red: 0.1126654819, green: 0.117790021, blue: 0.1262878478, alpha: 1)
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        return usernameLabel
    }()
    
    var perfilImgView: UIImageView = {
       var imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 26
        imgView.clipsToBounds = true
        return imgView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(perfilImgView)
        containerView.addSubview(usernameView)
        containerView.addSubview(nameView)
        self.contentView.addSubview(containerView)
        
//        MARK: - Constraints
//    set constraints inside cell

//         set image constraints
        NSLayoutConstraint.activate([
            perfilImgView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            perfilImgView.leadingAnchor.constraint(equalTo:self.contentView.leadingAnchor, constant:20),
            perfilImgView.widthAnchor.constraint(equalToConstant: 52),
            perfilImgView.heightAnchor.constraint(equalToConstant: 52)])
        
//        set container constraints
        NSLayoutConstraint.activate([
            containerView.centerYAnchor.constraint(equalTo:self.contentView.centerYAnchor),
            containerView.leadingAnchor.constraint(equalTo:self.perfilImgView.trailingAnchor, constant:20),
            containerView.trailingAnchor.constraint(equalTo:self.contentView.trailingAnchor, constant:-20),
            containerView.heightAnchor.constraint(equalToConstant:52)])
        
        
//        set username constraints
        NSLayoutConstraint.activate([
            usernameView.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
            usernameView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            usernameView.widthAnchor.constraint(equalToConstant: 212),
            usernameView.heightAnchor.constraint(equalToConstant: 20)])
        
//        set name constraints
        NSLayoutConstraint.activate([
            nameView.topAnchor.constraint(equalTo: self.usernameView.bottomAnchor),
            nameView.leadingAnchor.constraint(equalTo:self.containerView.leadingAnchor),
            nameView.widthAnchor.constraint(equalToConstant: 212),
            nameView.heightAnchor.constraint(equalToConstant: 20)])
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let name = name {
            nameView.text = name.text
        }
        if let username = username {
            usernameView.text = username.text
        }
        if let image = perfilImg {
            perfilImgView.image = image
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
