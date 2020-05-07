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
                description: "Hoje começei a estudar música e aprender a tocar violão. Está sendo uma ótima experiência e também está me ajudando a relaxar e controlar a ansiedade.",
                data: Date.dateFromCustomString(customString: "18/02/2020")
            )
        )
        cardsFromServer.append(
            Card(
                photo: "dog",
                feelingColor: feelingBem,
                title: "Meu Segundo Cachorro",
                description: "A experiência de criar um pet está sendo tão incrível que hoje eu decidi adotar meu segundo cahorro, o nome dele é Lion e ele está se dando muito bem com seu coleguinha Rex!",
                data: Date.dateFromCustomString(customString: "05/05/2020")
            )
        )
        cardsFromServer.append(
            Card(
                photo: "cabelo",
                feelingColor: feelingRadiante,
                title: "Pintei o cabelo",
                description: "Hoje eu decidi mudar um pouco e acabei pintando o cabelo.",
                data: Date.dateFromCustomString(customString: "18/02/2020")
            )
        )
        cardsFromServer.append(
            Card(
                photo: "dog2",
                feelingColor: feelingRadiante,
                title: "Meu Primeiro Cachorro",
                description: "Hoje estou me sentindo radiante pois ganhei meu primeiro pet. Um cachorro, seu nome é Rex e eu estou gostando muito da experiência.",
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
