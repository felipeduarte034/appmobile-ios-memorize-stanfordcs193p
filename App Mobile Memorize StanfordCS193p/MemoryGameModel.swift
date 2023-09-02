//
//  MemoryGameModel.swift
//  App Mobile Memorize StanfordCS193p
//
//  Created by Felipe Duarte on 02/09/23.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating func shuffle() {
        cards.shuffle()
        print("---------------------------------")
        for c in cards {
            print("Card: \(c.content)")
        }
    }
    
    struct Card {
        var isFaceUp = true
        var isMathed = false
        let content: CardContent
    }
}
