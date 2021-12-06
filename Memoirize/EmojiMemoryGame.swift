//
//  EmojiMemoryGame.swift
//  Memoirize
//
//  Created by diayan siat on 03/12/2021.
//

import SwiftUI

//This is the view model. The view model is part of the UI and so we are importing swiftui. Note: it is not part of the View 
class EmojiMemoryGame {
    //this is called a type property. It is created once
    static let emojis = ["👻", "💀", "👽", "🤖", "👾", "🕸", "🦕", "👑", "🌴", "🌍","🌈", "🚜", "🏀"]

    private var model: MemoirizeGame<String> = EmojiMemoryGame.createMemoryGame()

    //this is an instance variable so it is create every time you create an EmojiMemoryGame
    var cards: Array<MemoirizeGame<String>.Card> {
        return model.cards
    }
    
    //this is called a type function
    static func createMemoryGame() -> MemoirizeGame<String> {
        MemoirizeGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }
}
