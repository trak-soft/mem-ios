//
//  File.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 2/21/22.
//

import Foundation

/**
 different game state
 
 INIT - initial game state
 PREVIEW - preview cards before playing
 PLAY - currently playing the game
 OVER - game is over
 */
enum GameState {
    case INIT
    case PREVIEW
    case PLAY
    //won - cheks if user won or lose
    case OVER(won: Bool)
}
