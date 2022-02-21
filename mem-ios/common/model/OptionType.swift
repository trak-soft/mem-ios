//
//  OptionType.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/27/22.
//

import Foundation

/**
 oprion type
 */
enum OptionType: Hashable {
    case MODE(groupLength: Int,
              preview: Bool,
              numOfGroup: Int,
              timeLimit: Int?,
              clickLimit: Int?)
    case ADD
}
