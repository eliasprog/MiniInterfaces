//
//  ContatosTableViewCell.swift
//  MiniInterfaces
//
//  Created by Helaine Pontes on 29/04/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class ContatoTableViewCell: UITableViewCell {

    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var familyLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    
    static let xibName = "ContatoXibs"
    static let identifier = "contatoCell"
    
    
    func configCell(with contact: Contacts){
//        photoImageView.image = UIImage(named: contact.photo)
        familyLabel.text = contact.parents
        nameLabel.text = contact.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    
}
