//
//  AddMomento3Controller.swift
//  MiniInterfaces
//
//  Created by Lucas Oliveira on 06/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class AddMomento3Controller: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var card: Card?
    
    @IBAction func saveAndClose(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
        print("close")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feelingRadiante = FeelingCard(color: .radianteColor, name: "Radiante")
        card = Card(
        photo: "cabelo",
        feelingColor: feelingRadiante,
        title: "Pintei o cabelo",
        description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf"
        )
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib.init(nibName: "CardCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")
    }
    
}

extension AddMomento3Controller: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        cell.configure(with: self.card!)
        
        return cell
    }
    
    
}
