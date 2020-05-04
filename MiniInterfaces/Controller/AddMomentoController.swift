//
//  AddMomentoController.swift
//  MiniInterfaces
//
//  Created by Lucas Oliveira on 29/04/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class AddMomentoController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{

    @IBOutlet weak var navBar: UINavigationItem!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var txtLbl: UILabel!
    
    let data: [FeelingCard] = [FeelingCard(color: .radianteColor, name: "Radiante"),
    FeelingCard(color: .bemColor, name: "Bem"),
    FeelingCard(color: .normalColor, name: "Normal"),
    FeelingCard(color: .malColor, name: "Mal"),
    FeelingCard(color: .horrivelColor, name: "Horrível"),
    FeelingCard(color: .ansiosoColor, name: "Ansioso")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self as UICollectionViewDataSource
        collectionView.delegate = self as UICollectionViewDelegate
        collectionView.register(UINib.init(nibName: "FeelingCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeelingCard")
        collectionView.backgroundColor = .backgroundColor
        self.txtLbl.font = sfRounded(size: 28, weight: .medium)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeelingCard", for: indexPath) as! FeelingCardCollectionViewCell
        cell.configure(with: data[indexPath.row])
        
        
        return cell
    }
    

}


