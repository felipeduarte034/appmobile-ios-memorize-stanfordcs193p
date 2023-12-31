//
//  App_Mobile_Memorize_StanfordCS193pApp.swift
//  App Mobile Memorize StanfordCS193p
//
//  Created by Felipe Duarte on 27/08/23.
//

import SwiftUI

@main
struct App_Mobile_Memorize_StanfordCS193pApp: App {
    
    @StateObject var game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
