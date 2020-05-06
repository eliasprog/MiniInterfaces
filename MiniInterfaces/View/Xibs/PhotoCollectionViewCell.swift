//
//  PhotoCollectionViewCell.swift
//  MiniInterfaces
//
//  Created by Lucas Oliveira on 05/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photo: UIView!
    @IBOutlet weak var btnCamera: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnCamera.imageView?.contentMode = .scaleAspectFill
        photo.layer.cornerRadius = 5
        
    }

}
