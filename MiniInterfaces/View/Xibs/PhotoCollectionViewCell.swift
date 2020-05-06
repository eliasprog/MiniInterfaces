//
//  PhotoCollectionViewCell.swift
//  MiniInterfaces
//
//  Created by Lucas Oliveira on 05/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var btnCamera: UIButton!
    
    override func prepareForReuse() {
        photoView.image = nil
        btnCamera.isHidden = false
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnCamera.imageView?.contentMode = .scaleAspectFill
        photoView.layer.cornerRadius = 5
        
    }
    
    func configure(photoName: String?) {
        if let photo = photoName {
            self.photoView.image = UIImage(imageLiteralResourceName: photo)
            self.btnCamera.isHidden = true
            
        }
    }
    
}
