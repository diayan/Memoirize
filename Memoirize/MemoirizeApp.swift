//
//  MemoirizeApp.swift
//  Memoirize
//
//  Created by diayan siat on 30/11/2021.
//

import SwiftUI

@main
struct MemoirizeApp: App {
    //this creates the game and injects it into the content view 
    @StateObject var game = EmojiMemoryGame()

    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
