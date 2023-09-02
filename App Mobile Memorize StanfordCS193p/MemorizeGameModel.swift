//
//  MemorizeGameModel.swift
//  App Mobile Memorize StanfordCS193p
//
//  Created by Felipe Duarte on 31/08/23.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMathed: Bool
        var content: CardContent
    }
}
