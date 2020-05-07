//
//  PerfilTableViewCell.swift
//  MiniInterfaces
//
//  Created by Cecilia Soares on 05/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class PerfilTableViewCell: UITableViewCell {

    @IBOutlet weak var editionButton: UIButton!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var perfilImage: UIImageView!
    
    static let xibName = "PerfilCell"
    static let identifier = "perfilCellIdentifier"
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        nomeLabel.font = sfRounded(size: 21, weight: .medium)
        nomeLabel.textColor = .textColor
        perfilImage.image = UIImage(named: "perfilImage")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        perfilImage.layer.cornerRadius = perfilImage.frame.size.width / 2
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
