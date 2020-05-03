//
//  CardModel.swift
//  MiniInterfaces
//
//  Created by Elias Ferreira on 02/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import Foundation

class CardModel {
    
    static func getCards() -> [Card] {
        
        var cards = [Card]()
        
        let fellingCard1 = FeelingCard(color: .normalColor, name: "Normal")
        let fellingCard2 = FeelingCard(color: .bemColor, name: "Bem")
        
        let card1 = Card(
            photo: "dog",
            feelingColor: fellingCard1,
            title: "Meu Primeiro Cachorro",
            description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf …"
        )
        
        let card2 = Card(
            photo: "dog2",
            feelingColor: fellingCard2,
            title: "Meu Segundo Cachorro",
            description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will…"
        )
        
        cards.append(card1)
        cards.append(card2)
        
        return cards
    }
}
