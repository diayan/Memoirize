//
//  MemoirizeGame.swift
//  Memoirize
//
//  Created by diayan siat on 03/12/2021.
//

import Foundation
import UIKit

struct MemoirizeGame<CardContent> where CardContent: Equatable {
    private(set)  var cards: Array<Card> //the game is made up of cards
    
    //MARK: NOTE: a card can only match if and only if there is already one card that is facing up when you click another card
    private var indexOfOneAndOnlyOneFaceUpCard: Int? //optional because when you start the game the cards are all turned down initially

    
    //MARK: a user can choose a card
    mutating func choose(_ card: Card) {
        //Note we actually want to change the cards in the array above. So we have to find the card in this function in the cards above
//        if let chosenIndex = indexOf(of: card) {
//            cards[chosenIndex].isFaceUp.toggle()
//            print("chosenCard \(cards)")
//        }
        
        
//        if let chosenIndex = cards.firstIndex(where: { aCardInTheCardsArray in aCardInTheCardsArray.id == card.id}) {
//            //the above line reads as follows: look in the cards array and find the first index where that card's id is equal to my card's (the selected card) id
//        }
        
        //the above if let with first index can be written simply as follows:
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id }), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfOneAndOnlyOneFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                indexOfOneAndOnlyOneFaceUpCard = nil
            } else {
                // 0..<cards.count == cards.indices
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfOneAndOnlyOneFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
            print("chosenCard \(cards)")
        }
    }
    
//    func indexOf(of card: Card) -> Int? {
//        for index in 0..<cards.count {
//            if cards[index].id == card.id {
//                return index
//            }
//        }
//        return nil
//    }
    
    //MARK: we create this initialiser because we want every game to start by creating the cards
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        //MARK: add numberOfPairsOfCards x 2 to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(id: pairIndex*2, content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }
    
    //MARK: Identifiable is an identifier that is able to distinguish between each card
    struct Card: Identifiable {
        let id: Int
        //MARK: every game starts off with card faces down and not matched so set default values of the two to false
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent //the content of a card can be anything. i.e emoji, image, an object of any type
    }
}
