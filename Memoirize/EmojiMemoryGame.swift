//
//  EmojiMemoryGame.swift
//  Memoirize
//
//  Created by diayan siat on 03/12/2021.
//

import SwiftUI

//This is the view model. The view model is part of the UI and so we are importing swiftui
class EmojiMemoryGame {
    static var emojis = ["👻", "💀", "👽", "🤖", "👾", "🕸", "🦕", "👑", "🌴", "🌍","🌈", "🚜", "🏀"]

    
    static func createMemoryGame() -> MemoirizeGame<String> {
        MemoirizeGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
     
    private var model: MemoirizeGame<String> = EmojiMemoryGame.createMemoryGame()
    
    var cards: Array<MemoirizeGame<String>.Card> {
        return model.cards
    }
}
