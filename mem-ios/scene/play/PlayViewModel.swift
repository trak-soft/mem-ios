//
//  PlayViewModel.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/27/22.
//

import Foundation
import SwiftUI

class PlayViewModel: ObservableObject {
    var title: String = NSLocalizedString("play", comment: "")
    var image: String = "ic_add_game"
    var tint: Color = Color(UIColor.label)
}
