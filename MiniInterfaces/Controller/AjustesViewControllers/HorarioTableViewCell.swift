//
//  HorarioTableViewCell.swift
//  MiniInterfaces
//
//  Created by Cecilia Soares on 05/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class HorarioTableViewCell: UITableViewCell {

    @IBOutlet weak var horarioLabel: UILabel!
    @IBOutlet weak var horaLabel: UILabel!
    @IBOutlet weak var horarioPickerView: UIDatePicker!
    
    static let xibName = "HorarioCell"
    static let identifier = "horarioCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        horarioLabel.font = sfRounded(size: 17, weight: .regular)
        horarioLabel.textColor = .textColor
        horaLabel.font = sfRounded(size: 17, weight: .regular)
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
