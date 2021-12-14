//
//  ContentView.swift
//  Memoirize
//
//  Created by diayan siat on 30/11/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGameViewModel
        
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }
        }
        .foregroundColor(.purple)
        .padding(.horizontal)
    }
}

struct CardView: View {
    //We pass only the card here because that is the only thing the CardView needs to do its job i.e to display a card
    let card: MemoirizeGame<String>.Card
    
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
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
