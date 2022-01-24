//
//  EmojiMemoryGame.swift
//  Memoirize
//
//  Created by diayan siat on 03/12/2021.
//

import SwiftUI

//MARK: Observable objects are objects that broadcasts/publishes changes when something changes
//This is the view model. The view model is part of the UI and so we are importing swiftui. Note: it is not part of the View 
class EmojiMemoryGameViewModel: ObservableObject {
    //this is called a type property. It is created once
    private static let emojis = ["👻", "💀", "👽", "🤖", "👾", "🕸", "🦕", "👑", "🌴", "🌍","🌈", "🚜", "🏀"]

    //this line makes the view model reactive. It's is because MemoirizeGame is a struct and swift detects changes in structs. Can't do this in classes
    //MARK: the @Published keyword automatically calls objectWillChange.send() anytime the model changes
    @Published private var model: MemoirizeGame<String> = EmojiMemoryGameViewModel.createMemoryGame()

    //this is an instance variable so it is create every time you create an EmojiMemoryGame
    var cards: Array<MemoirizeGame<String>.Card> {
        return model.cards
    }
    
    //this is called a type function
    private static func createMemoryGame() -> MemoirizeGame<String> {
        MemoirizeGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            EmojiMemoryGameViewModel.emojis[pairIndex]
        }
    }
    
    // MARK: - Intent(s)
    func choose(_ card: MemoirizeGame<String>.Card) {
        //MARK: objectWillChange.send() //MARK: This makes the function broadcast changes every time it is called. Call it anytime you change the model and want observe a change
        model.choose(card)
    }
}
