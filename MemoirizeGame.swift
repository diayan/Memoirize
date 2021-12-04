//
//  MemoirizeGame.swift
//  Memoirize
//
//  Created by diayan siat on 03/12/2021.
//

import Foundation
import UIKit

struct MemoirizeGame<CardContent> {
    private(set)  var cards: Array<Card> //the game is made up of cards
    
    //a user can choose a card
    func choose(_ card: Card) {
        
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        //add numberOfPairsOfCards x 2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    struct Card {
        //every game starts off with card faces down and not matched so set default values of the two to false
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent //the content of a card can be anything. i.e emoji, image, an object of any type
        
    }
}
