//
//  FeelingCardCollectionViewCell.swift
//  MiniInterfaces
//
//  Created by Lucas Oliveira on 30/04/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class FeelingCardCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var feelingLbl: UILabel!
    @IBOutlet weak var backgroundCard: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.colorView.layer.cornerRadius = 4
       
        feelingLbl.font = sfRounded(size: 15, weight: .semibold)
        feelingLbl.textColor = .textColor
        
        backgroundCard.layer.shadowColor = UIColor.black.cgColor
        backgroundCard.layer.shadowOpacity = 0.16
        backgroundCard.layer.shadowRadius = 4
        backgroundCard.layer.shadowOffset = .init(width: 0, height: 3)
        
        self.backgroundColor = .backgroundColor
        
        backgroundCard.layer.cornerRadius = 6
    }
    
    func configure(with model: FeelingCard){
        colorView.backgroundColor = model.color
        feelingLbl.text = model.name
    }

}
