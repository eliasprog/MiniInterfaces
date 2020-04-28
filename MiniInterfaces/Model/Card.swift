//
//  Card.swift
//  miniInterfaces10
//
//  Created by Lucas Oliveira on 28/04/20.
//  Copyright © 2020 Helaine Pontes. All rights reserved.
//

import Foundation

class Card {
    let photo: String
    let feelingColor: FeelingCard
    let title: String
    let description: String
    
    init(photo: String, feelingColor: FeelingCard, title: String, description: String) {
        self.photo = photo
        self.feelingColor = feelingColor
        self.title = title
        self.description = description
        
    }
}
