//
//  CardModel.swift
//  MiniInterfaces
//
//  Created by Elias Ferreira on 02/05/20.
//  Copyright © 2020 Elias Ferreira. All rights reserved.
//

import Foundation

// Estrutura de cards com datas.
struct CardsStruct {
    var day: String
    var month: String
    var cards = [Card]()
    
    init(day: String, month: String, cards: [Card]) {
        self.day = day
        self.month = month
        self.cards = cards
    }
}
// Data formatada
extension Date {
    static func dateFromCustomString(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
        return dateFormatter.date(from: customString) ?? Date()
    }
}

// MARK: - Model

class CardModel {
    
    // Todos os meses de forma abreviada.
    static let meses = [
        "Jan", "Fev", "Mar", "Abr", "Mai", "Jun",
        "Jul", "Ago", "Set", "Out", "Nov", "Dez",
    ]
    
    //Feeling
    static let feelingRadiante = FeelingCard(color: .radianteColor, name: "Radiante")
    static let feelingBem = FeelingCard(color: .bemColor, name: "Bem")
    static let feelingNormal = FeelingCard(color: .normalColor, name: "Normal")
    //let feelingMal = FeelingCard(color: .malColor, name: "Mal")
    //let feelingHorrivel = FeelingCard(color: .horrivelColor, name: "Horrivel")
    //let feelingAnsioso = FeelingCard(color: .ansiosoColor, name: "Ansioso")
    
    // Cards
    static var cardsFromServer = [Card]()
    
    static func loadCards() {
        cardsFromServer.append(
            Card(
                photo: "violao",
                feelingColor: feelingBem,
                title: "Estou aprendendo violão",
                description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will…",
                data: Date.dateFromCustomString(customString: "18/02/2020")
            )
        )
        cardsFromServer.append(
            Card(
                photo: "dog2",
                feelingColor: feelingBem,
                title: "Meu Segundo Cachorro",
                description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf …",
                data: Date.dateFromCustomString(customString: "05/05/2020")
            )
        )
        cardsFromServer.append(
            Card(
                photo: "cabelo",
                feelingColor: feelingRadiante,
                title: "Pintei o cabelo",
                description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will…",
                data: Date.dateFromCustomString(customString: "18/02/2020")
            )
        )
        cardsFromServer.append(
            Card(
                photo: "dog",
                feelingColor: feelingNormal,
                title: "Meu Primeiro Cachorro",
                description: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf asdf …",
                data: Date.dateFromCustomString(customString: "18/02/2020")
            )
        )
        // Fim Cards
    }
    
    static func getAllCards() -> [CardsStruct] {
        var allCards = [CardsStruct]()
        // Agrupa por data os card em um dicionario.
        let groupedCards = Dictionary(grouping: cardsFromServer) { (element) -> Date in
            return element.data
        }
        // Ordena os cards
        //let sortedKeys = groupedCards.keys.sorted().reversed()
        
        /**
         * Separa cada grupo em um array
         * Coloca na estrutura de cards com dia e mes.
         */
        let sortedKeys = groupedCards.keys.sorted()
        let orderedKeys = sortedKeys.reversed()
        
        orderedKeys.forEach { (key) in
            
            let values = groupedCards[key]
            
            let components = Calendar.current.dateComponents([Calendar.Component.day, Calendar.Component.month], from: key)
            
            let cardStruct = CardsStruct(
                day: String(components.day!),
                month: meses[(components.month! - 1)],
                cards: values ?? []
            )
            
            allCards.append(cardStruct)
        }
        // Retorna a estrutura montada com todos os cards
        return allCards
    }
    
    static func saveCard(card: Card) {
        cardsFromServer.append(card)
    }
}
