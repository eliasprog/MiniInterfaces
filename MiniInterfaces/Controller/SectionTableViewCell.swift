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
        
        collectionView.register(UINib.init(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")
    }
    
    override func prepareForReuse() {
        self.dayLabel.text = ""
        self.monthLabel.text = ""
        self.cards = []
    }
    
    func configure(cardStruct: CardsStruct) {
        
        self.dayLabel.text = cardStruct.day
        self.monthLabel.text = cardStruct.month
        self.cards = cardStruct.cards
        
        collectionView.reloadData()
    }

}

extension SectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cards.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
    
        cell.configure(with: cards[indexPath.row])
        
        return cell
    }
    
    
}
