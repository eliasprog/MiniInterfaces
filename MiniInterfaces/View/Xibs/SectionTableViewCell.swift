//
//  SectionCollectionViewCell.swift
//  MiniInterfaces
//
//  Created by Elias Ferreira on 03/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var cards = [Card]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        
        dayLabel.font = sfRounded(size: 34, weight: .semibold)
        dayLabel.textColor = .textColor
        monthLabel.font = sfRounded(size: 16, weight: .semibold)
        monthLabel.textColor = .textColor
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        cards = CardModel.getCards()
        
        collectionView.register(UINib.init(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")
    }

}

extension SectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
    
        cell.congigure(with: cards[indexPath.row])
        
        return cell
    }
    
    
}
