//
//  LembreteTableViewCell.swift
//  MiniInterfaces
//
//  Created by Cecilia Soares on 05/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class LembreteTableViewCell: UITableViewCell {

    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var lembreteLabel: UILabel!
    static let xibName = "LembreteCell"
    static let identifier = "lembreteCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        lembreteLabel.font = sfRounded(size: 17, weight: .regular)
        lembreteLabel.textColor = .textColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
