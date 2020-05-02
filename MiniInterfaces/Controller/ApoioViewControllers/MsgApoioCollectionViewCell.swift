//
//  MsgApoioCollectionViewCell.swift
//  MiniInterfaces
//
//  Created by Helaine Pontes on 30/04/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class MsgApoioCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var msgTextView: UITextView!

    //@IBOutlet weak var backgroundCVView: UIView!
    
    static let xibName = "MsgApoioXibs"
    static let identifier = "msgCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()        
        msgTextView.font = sfRounded(size: 20, weight: .semibold)
        msgTextView.textColor = .white
        msgTextView.backgroundColor = .primaryColor
    }
}
