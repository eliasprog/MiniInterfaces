//
//  CardCollectionViewCell.swift
//  MiniInterfaces
//
//  Created by Elias Ferreira on 02/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var feelingView: UIView!
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Initialization code
    }
    
    override func prepareForReuse() {
        cardImage.image = nil
        feelingView.backgroundColor = nil
        cardTitle.text = ""
        cardText.text = ""
    }
    
    func congigure(with card: Card) {
        cardImage.image = UIImage(named: card.photo)
        feelingView.backgroundColor = card.feelingColor.color
        cardTitle.text = card.title
        cardText.text = card.description
    }
}
