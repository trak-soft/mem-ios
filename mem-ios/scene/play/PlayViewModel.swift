//
//  PlayViewModel.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/27/22.
//

import Foundation
import SwiftUI

class PlayViewModel: ObservableObject {
    let mode: OptionType
    let tint: Color
    @Published var icons: [Int] = []
    @Published var timeLeft: Int? = nil
    @Published var clicksLeft: Int? = nil
    
    init(
        mode: OptionType,
        tint: Color = Color(UIColor.label)
    ) {
        self.mode = mode
        self.tint = tint
        
        if case .Mode(
            let groupLength,
            _,
            let numOfGroup,
            let time,
            let click
        ) = mode {
            self.timeLeft = time
            self.clicksLeft = click
            self.icons = Array(repeating: -1 , count: groupLength * numOfGroup)
        }
    }
    
    func getIconAt(index: Int) -> Int {
        return icons[index]
    }
}
