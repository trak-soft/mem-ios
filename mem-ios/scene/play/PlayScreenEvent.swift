//
//  PlayScreenEvent.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 2/16/22.
//

import Foundation

/**
 Play Screen Event
 
 CardClick - card click event
 Reset - game state reset event
 */
enum PlayScreenEvent {
    case CardClick(index: Int)
    case Reset
}
