//
//  Card.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 2/15/22.
//

import Foundation

struct Card {
    let icon: Int
    var state: CardState = .FACE_DOWN
}

enum CardState{
    case FACE_UP
    case FACE_DOWN
    case SOLVED
}
