//
//  PickerTableViewCell.swift
//  MiniInterfaces
//
//  Created by Cecilia Soares on 05/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

protocol Horario: class {
    func recebeHora(hora: String)
}

class PickerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var horaPickerView: UIDatePicker!
    
    static let xibName = "Picker"
    static let identifier = "pickerCell"
    
    weak var horas: Horario?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func changedPicker(_ sender: Any) {
        let formater = DateFormatter()
        formater.dateFormat = "HH:mm"
        horas?.recebeHora(hora: formater.string(from: horaPickerView.date)) 
        
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

