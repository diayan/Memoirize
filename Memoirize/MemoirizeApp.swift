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
    let game = EmojiMemoryGameViewModel()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: game)
        }
    }
}
