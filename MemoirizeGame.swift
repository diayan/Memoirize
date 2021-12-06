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
    mutating func choose(_ card: Card) {
        //Note we actually want to change the cards in the array above. So we have to find the card in this function in the cards above
        let chosenIndex = indexOf(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("chosenCard \(cards)")
    }
    
    func indexOf(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    //we create this initialiser because we want every game to start by creating the cards
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        //add numberOfPairsOfCards x 2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    struct Card: Identifiable {
        var id: Int
        //every game starts off with card faces down and not matched so set default values of the two to false
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent //the content of a card can be anything. i.e emoji, image, an object of any type
        
    }
}
