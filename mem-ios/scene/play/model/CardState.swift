//
//  CardState.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 2/21/22.
//

import Foundation

/**
 card states
 
 - FACE_UP - card face up
 - FACE_DOWN -card face down
 - SOLVED - card group has been solved
 */
enum CardState {
    case FACE_UP
    case FACE_DOWN
    case SOLVED
    case WRONG
}
