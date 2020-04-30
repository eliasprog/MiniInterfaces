//
//  Contato.swift
//  miniInterfaces10
//
//  Created by Lucas Oliveira on 28/04/20.
//  Copyright © 2020 Helaine Pontes. All rights reserved.
//

import Foundation

class Contacts {
    let photo: String
    let name: String
    let parents: String
    let number: Int
    
    init(photo: String, name: String, parents: String, number:Int){
        self.photo = photo
        self.name = name
        self.parents = parents
        self.number = number
    }
}
