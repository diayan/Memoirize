//
//  ContentView.swift
//  Memoirize
//
//  Created by diayan siat on 30/11/2021.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    //MARK: @ObservedObject says whenever something changes in this view model, rebuild the entire view 
    @ObservedObject var gameViewModel: EmojiMemoryGameViewModel //this will be injected everywhere we create the EmojiMemoryGameView view
        
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(gameViewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            gameViewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.purple)
        .padding(.horizontal)
    }
}

//When you build a view, only parse in it the minimum it needs to do it's job
struct CardView: View {
    //We pass only the card here because that is the only thing the CardView needs to do its job i.e to display a card
    let card: EmojiMemoryGameViewModel.Card
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                cardShape.opacity(0)
            }else {
                cardShape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGameViewModel()
        EmojiMemoryGameView(gameViewModel: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(gameViewModel: game)
            .preferredColorScheme(.light)
    }
}
