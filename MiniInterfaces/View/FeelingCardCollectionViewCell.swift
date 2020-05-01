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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.colorView.layer.cornerRadius = 4
        
        let fontSize: CGFloat = 15
        let systemFont = UIFont.systemFont(ofSize: fontSize, weight: .semibold)
        let roundedFont: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            roundedFont = UIFont(descriptor: descriptor, size: fontSize)
        }
        else {
             roundedFont = systemFont
        }
        
        feelingLbl.font = roundedFont
        feelingLbl.textColor = .textColor
    }
    
    func configure(with model: FeelingCard){
        colorView.backgroundColor = model.color
        feelingLbl.text = model.name
    }

}
