//
//  MomentosController.swift
//  MiniInterfaces
//
//  Created by Elias Ferreira on 29/04/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class MomentosController: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")
        
    }
    
    @IBAction func addMomentoTapped(_ sender: Any) {
        
        self.performSegue(withIdentifier: "AddMomentoSegue", sender: self)
        
    }
    
}

extension MomentosController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        cell.congigure(with: CardModel.getCard())
        
        return cell
    }
    
    
}
