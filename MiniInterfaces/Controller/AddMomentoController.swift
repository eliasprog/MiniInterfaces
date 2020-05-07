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
        self.txtLbl.textColor = .textColor
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.textColor, .font: sfRounded(size: 34, weight: .semibold)]
        
        self.tabBarController?.tabBar.isHidden = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeelingCard", for: indexPath) as! FeelingCardCollectionViewCell
        cell.configure(with: data[indexPath.row])
        
        return cell
    }
    

    var selectedCell: FeelingCardCollectionViewCell? = nil
    var previousSelectedCell: FeelingCardCollectionViewCell? = nil
    var selectedItem: Int?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AddMomento2ViewController {
            let vc = segue.destination as? AddMomento2ViewController
            vc?.selectedFeeling = data[selectedItem!]
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FeelingCardCollectionViewCell
        self.selectedItem = indexPath.item
        
        if selectedCell != previousSelectedCell {
            self.previousSelectedCell = selectedCell
            self.selectedCell = cell
            
            UIView.animate(withDuration: 0.4, animations: {
                self.previousSelectedCell!.layer.setAffineTransform(CGAffineTransform(rotationAngle: 0))
            })
        }
        
        self.selectedCell = cell
        UIView.animate(withDuration: 0.4, animations: {
            self.selectedCell?.layer.setAffineTransform(CGAffineTransform(rotationAngle: 0.087))

        }, completion:  { _ in
            self.performSegue(withIdentifier: "AddMomento2Segue", sender: self)
        })
        
    }
    
}
