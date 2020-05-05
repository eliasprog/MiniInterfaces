//
//  CardModel.swift
//  MiniInterfaces
//
//  Created by Elias Ferreira on 02/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import Foundation

struct CardsStruct {
    var day: String
    var month: String
    var year: String
    var cards = [Card]()
    
    init(day: String, month: String, year: String, cards: [Card]) {
        self.day = day
        self.month = month
        self.year = year
        self.cards = cards
    }
}

class CardModel {
    
    static func getAllCards() -> [CardsStruct] {
        var allCards = [CardsStruct]() // Array de estruturas de cards
        var cards1 = [Card]() // Lista de cards 1
        var cards2 = [Card]() // Lista de cards 2
        
        //Feeling
        let feelingRadiante = FeelingCard(color: .radianteColor, name: "Radiante")
        let feelingBem = FeelingCard(color: .bemColor, name: "Bem")
        let feelingNormal = FeelingCard(color: .normalColor, name: "Normal")
        //let feelingMal = FeelingCard(color: .malColor, name: "Mal")
        //let feelingHorrivel = FeelingCard(color: .horrivelColor, name: "Horrivel")
        //let feelingAnsioso = FeelingCard(color: .ansiosoColor, name: "Ansioso")
        // -----------------------------------
        let card1 = Card(
            photo: "dog",
            feelingColor: feelingNormal,
            title: "Meu Primeiro Cachorro",
            description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf …"
        )
        
        let card2 = Card(
            photo: "violao",
            feelingColor: feelingBem,
            title: "Estou aprendendo violão",
            description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will…"
        )
        // -----------------------------------
        
        let card3 = Card(
            photo: "dog2",
            feelingColor: feelingBem,
            title: "Meu Segundo Cachorro",
            description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf …"
        )
        
        let card4 = Card(
            photo: "cabelo",
            feelingColor: feelingRadiante,
            title: "Pintei o cabelo",
            description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will…"
        )
        
        // -----------------------------------
        cards1.append(card1)
        cards1.append(card2)
        cards2.append(card3)
        cards2.append(card4)
        
        let cardsStruct1 = CardsStruct(day: "01", month: "Jan", year: "2020", cards: cards1)
        let cardsStruct2 = CardsStruct(day: "02", month: "Jan", year: "2020", cards: cards2)
        // Montando struct
        allCards.append(cardsStruct1)
        allCards.append(cardsStruct2)
        
        return allCards
    }
}
