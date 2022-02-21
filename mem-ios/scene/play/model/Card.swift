//
//  Card.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 2/15/22.
//

import Foundation

/**
 Card model class
 
 - Parameter icon - card icon
 - Parameter state - card state
 */
struct Card {
    let icon: Int
    var state: CardState = .FACE_DOWN
}
