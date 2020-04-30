//
//  AddMomentoController.swift
//  MiniInterfaces
//
//  Created by Lucas Oliveira on 29/04/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import UIKit

class AddMomentoController: UIViewController {

    @IBOutlet weak var largeTitle: UILabel!
    @IBOutlet weak var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        largeTitle.font = UIFont(name:"SFRounded-Bold", size: 34.0)
        
    }


}

