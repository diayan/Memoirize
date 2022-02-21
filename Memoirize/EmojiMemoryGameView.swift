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
        AspectVGrid(items: gameViewModel.cards, aspectRatio: 2/3) { card in
            cardView(for: card)
        }
            .foregroundColor(.purple)
            .padding(.horizontal)
    }
    
    
    @ViewBuilder
    private func cardView(for card: EmojiMemoryGameViewModel.Card) -> some View {
        if card.isMatched && !card.isFaceUp {
            Rectangle().opacity(0)
        }else {
            CardView(card: card)
                .padding(4)
                .onTapGesture {
                    gameViewModel.choose(card)
                }
        }
    }
}

//When you build a view, only parse in it the minimum it needs to do it's job
struct CardView: View {
    //We pass only the card here because that is the only thing the CardView needs to do its job i.e to display a card
    let card: EmojiMemoryGameViewModel.Card
    
    var body: some View {
        GeometryReader(content: { geometry in
            ZStack {
                let cardShape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    cardShape.fill().foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth: 3)
                    Text(card.content)
                        .font(font(in: geometry.size))
                } else if card.isMatched {
                    cardShape.opacity(0)
                }else {
                    cardShape.fill()
                }
            }
        })
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * 0.8)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScaleFactor: CGFloat = 0.75
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
