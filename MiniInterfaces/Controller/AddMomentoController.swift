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
    
    let data: [FeelingCard] = [FeelingCard(color: .green, name: "Radiante"),
    FeelingCard(color: .systemGreen, name: "Bem"),
    FeelingCard(color: .systemYellow, name: "Normal"),
    FeelingCard(color: .orange, name: "Mal"),
    FeelingCard(color: .systemRed, name: "Horrível"),
    FeelingCard(color: .systemPurple, name: "Ansioso")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self as UICollectionViewDataSource
        collectionView.delegate = self as UICollectionViewDelegate
        collectionView.register(UINib.init(nibName: "FeelingCardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "FeelingCard")
        collectionView.backgroundColor = .backgroundColor
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeelingCard", for: indexPath) as! FeelingCardCollectionViewCell
        cell.configure(with: data[indexPath.row])
        cell.layer.cornerRadius = 6
        
        return cell
    }
    

}


