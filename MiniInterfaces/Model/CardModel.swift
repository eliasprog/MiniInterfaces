//
//  CardModel.swift
//  MiniInterfaces
//
//  Created by Elias Ferreira on 02/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import Foundation

class CardModel {
    
    static func getCard() -> Card {
        
        let fellingCard = FeelingCard(
            color: .normalColor,
            name: "Normal"
        )
        
        let card = Card(
            photo: "dog-img",
            feelingColor: fellingCard,
            title: "Teste",
            description: "Testando..."
        )
        
        return card
    }
}
