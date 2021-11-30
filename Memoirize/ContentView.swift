//
//  ContentView.swift
//  Memoirize
//
//  Created by diayan siat on 30/11/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView()
            CardView()
            CardView()
            CardView()
        }
        .padding(.horizontal)
        .foregroundColor(.purple)
    }
}

struct CardView: View {
    var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let cardShape = RoundedRectangle(cornerRadius: 20)

            if isFaceUp {
                cardShape.fill().foregroundColor(.white)
                cardShape.stroke(lineWidth: 2)
                Text("👻").font(.largeTitle)
            }else {
                cardShape.fill()
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
