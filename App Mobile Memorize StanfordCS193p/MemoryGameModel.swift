//
//  MemoryGameModel.swift
//  App Mobile Memorize StanfordCS193p
//
//  Created by Felipe Duarte on 02/09/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)_alfa"))
            cards.append(Card(content: content, id: "\(pairIndex+1)_beta"))
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter { index in cards[index].isFaceUp }.only }
        set { cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
    }
    
    mutating func choose(_ card: Card) {
        //print("chose \(card)")
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }) {
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched {
                
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                    if cards[chosenIndex].content == cards[potentialMatchIndex].content { //achou o par de cartas.
                        cards[chosenIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                } else { //o conteudo das duas cartas escolhidas nao correspondem.
                    indexOfTheOneAndOnlyFaceUpCard = chosenIndex
                }
                
                cards[chosenIndex].isFaceUp = true //mantem virado pra cima a segunda carta escolhida.
            }
        }
    }
    
    /*private func index(of card: Card) -> Int? {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }*/
    
    mutating func shuffle() {
        cards.shuffle()
        print("---------------------------------")
        for c in cards {
            print("Card: \(c.content)")
        }
    }
    
    struct Card: Equatable, Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
    }
}

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
