//
//  EmojiMemoryGame.swift
//  App Mobile Memorize StanfordCS193p
//
//  Created by Felipe Duarte on 01/09/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["🎃","👻","🕷️","👀","☠️","👽","😈","🤡","🌙","⭐️"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 2) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    //var objectWillChange: ObservableObjectPublisher
    
    @Published private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    // MARK: - Intents
    func shuffle() {
        model.shuffle()
        //objectWillChange.send()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}

