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
    @Published var cards: [Card] = []
    @Published var groupSolved: Int = 0
    @Published var timeLeft: Int? = nil
    @Published var clicksLeft: Int? = nil
    private var actives: [Int] = []
    
    init(
        mode: OptionType,
        tint: Color = Color(UIColor.label)
    ) {
        self.mode = mode
        self.tint = tint
        groupSolved = 0
        if case .Mode(let groupLength, _, let numOfGroup, let time, let click) = mode {
            self.timeLeft = time
            self.clicksLeft = click
            for _ in 0..<groupLength {
                for j in 0..<numOfGroup {
                    cards.append(Card(icon: j))
                }
            }
        }
    }
    
    func onEvent(event: PlayScreenEvent) {
        switch(event) {
        case .CardClick(let index): onCardClick(index: index)
        }
    }
    
    private func onCardClick(index: Int) {
        if case .Mode(_, _, let numOfGroup, _, _) = mode {
            if groupSolved < numOfGroup {
                switch cards[index].state {
                case .FACE_UP: break
                case .FACE_DOWN :
                    if let clicksLeft = clicksLeft {
                        if clicksLeft > 0 {
                            addToActive(index: index)
                        }
                    } else {
                        addToActive(index: index)
                    }
                    
                case .SOLVED: break
                }
            }
        }
    }
    
    private func addToActive(index: Int) {
        if let clicksLeft = clicksLeft {
            if clicksLeft > 0 {
                self.clicksLeft = clicksLeft - 1
            }
        }
        if case .Mode(let groupLength, _, _, _, _) = mode {
            if actives.count > 1 && cards[actives[actives.count - 2]].icon != cards[actives[actives.count - 1]].icon {
                for active in actives {
                    cards[active].state = .FACE_DOWN
                }
                actives.removeAll()
            } else if actives.count == groupLength {
                for active in actives {
                    cards[active].state = .SOLVED
                }
                actives.removeAll()
            }
            actives.append(index)
            cards[index].state = .FACE_UP
            
        }
    }
}
