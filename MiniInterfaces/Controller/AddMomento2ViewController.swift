//
//  AddMomentos2ViewController.swift
//  MiniInterfaces
//
//  Created by Lucas Oliveira on 04/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class AddMomento2ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate {

    @IBOutlet weak var addPhotoLbl: UILabel!
    @IBOutlet weak var storyTitleLbl: UILabel!
    @IBOutlet weak var importantMomentLbl: UILabel!
    
    @IBOutlet weak var storyTitleCounter: UILabel!
    @IBOutlet weak var importantMomentCounter: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var txtFieldTitle: UITextField!
    @IBOutlet weak var txtFieldDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        allLblRounded()
        allFontColor()
        
        collectionView.dataSource = self as UICollectionViewDataSource
        collectionView.delegate = self as UICollectionViewDelegate
        collectionView.register(UINib.init(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "photoSelectionCell")
        
        txtFieldTitle.delegate = self
        txtFieldDescription.delegate = self
        
        txtFieldTitle.borderStyle = .none
        txtFieldDescription.borderStyle = .none
        
        txtFieldTitle.textColor = .textColor
        txtFieldDescription.textColor = .textColor
        
    }
    
    let photoData = [nil, "pessoaAleatoria1", "pessoaAleatoria2", "pessoaAleatoria3", "pessoaAleatoria4", "dog", "violao"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoData.count
    }
    

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoSelectionCell", for: indexPath) as! PhotoCollectionViewCell
        cell.configure(photoName: photoData[indexPath.row])
        cell.layer.cornerRadius = 5
        return cell
    }
    
    func allLblRounded(){
        addPhotoLbl.font = sfRounded(size: 22, weight: .medium)
        storyTitleLbl.font = sfRounded(size: 22, weight: .medium)
        importantMomentLbl.font = sfRounded(size: 22, weight: .medium)
        storyTitleCounter.font = sfRounded(size: 17, weight: .medium)
        importantMomentCounter.font = sfRounded(size: 17, weight: .medium)
    }
    
    func allFontColor (){
        addPhotoLbl.textColor = .textColor
        storyTitleLbl.textColor = .textColor
        importantMomentLbl.textColor = .textColor
        storyTitleCounter.textColor = .textColor
        importantMomentCounter.textColor = .textColor
    }
    
    @IBAction func btnNext(_ sender: Any) {
        self.performSegue(withIdentifier: "AddMomento3Segue", sender: self)
    }
    
    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let oldValue = textField.text else {
            return true
        }
        
        if textField == txtFieldTitle {
            if oldValue.count > 29 && range.length <= 0 { return false }
            let newLength = oldValue.count + string.count - range.length
            storyTitleCounter.text =  "\(newLength)/30"
        }
        
        if textField == txtFieldDescription {
            if oldValue.count > 109 && range.length <= 0 { return false }
            let newLength = oldValue.count + string.count - range.length
            importantMomentCounter.text =  "\(newLength)/110"
        }

        
        return true
    }

    /*
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
