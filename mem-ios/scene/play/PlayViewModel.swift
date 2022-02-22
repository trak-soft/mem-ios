//
//  PlayViewModel.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/27/22.
//

import Foundation
import SwiftUI

/**
 Play view modelc
 
 - Parameter mode - game mode
 - Parameter cards - list of cards
 - Parameter groupSolved - number of groupsolved
 - Parameter timeLeft - time left
 - Parameter clicksLeft - clicks left
 - Parameter state - game state
 - Parameter timer - count down timer
 */
class PlayViewModel: ObservableObject {
    static let MILLISECOND: Int = 1000
    static let TIME_INTERVAL: Int = 10
    static let PREVIEW_TIME: Int = 3 * MILLISECOND
    let mode: OptionType

    @Published var cards: [Card] = []
    @Published var groupSolved: Int = 0
    @Published var timeLeft: Int? = nil
    var previewTimeLeft: Int? = nil
    @Published var clicksLeft: Int? = nil
    @Published var state: GameState = .INIT

    var timer = Timer.publish(every: TimeInterval(Float(TIME_INTERVAL) / Float(MILLISECOND)),
                              on: .main,
                              in: .common).autoconnect()
    
    var previewTimer = Timer.publish(every: TimeInterval(Float(TIME_INTERVAL) / Float(MILLISECOND)),
                              on: .main,
                              in: .common).autoconnect()
    
    private var actives: [Int] = []
    
    init(
        mode: OptionType
    ) {
        self.mode = mode
        toInitState(first: true)
    }
    
    // MARK: events
    
    /**
     event handler
     - Parameter event - event to be handled
     */
    func onEvent(event: PlayScreenEvent) {
        switch(event) {
        case .CardClick(let index): onCardClick(index: index)
        case .Reset: onResetEvent()
        }
    }
    
    /**
     on reset events
     */
    private func onResetEvent() {
        toInitState()
        if case .MODE(_, let preview, _, _, _) = mode {
            if preview {
                toPreviewState()
            } else {
                toPlayState()
            }
        }
    }
    
    /**
     on card click event
     - Parameter -  index of card
     */
    private func onCardClick(index: Int) {
        if case .MODE(_, _, let numOfGroup, let clickLimit, let timeLimit) = mode {
            if case .PLAY = state {
                switch cards[index].state {
                case .FACE_UP: break
                case .FACE_DOWN :
                    if timeLimit != nil && clickLimit != nil {
                        if let clicksLeft = clicksLeft, let timeLeft = timeLeft{
                            if clicksLeft > 0 && timeLeft > 0 {
                                addToActive(index: index)
                            }
                        }
                    } else if timeLimit != nil {
                        if let timeLeft = timeLeft {
                            if timeLeft > 0 {
                                addToActive(index: index)
                            }
                        }
                    } else if clickLimit != nil {
                        if let clicksLeft = clicksLeft {
                            if clicksLeft > 0 {
                                addToActive(index: index)
                            }
                        }
                    } else {
                        addToActive(index: index)
                    }
                case .SOLVED: break
                }
                if groupSolved == numOfGroup || clicksLeft == 0 || timeLeft == 0 {
                    toOverState()
                }
            }
        }
    }
    
    // MARK: change state
    
    // changes state to init
    private func toInitState(first: Bool = false) {
        if case .MODE(let groupLength, _,let numOfGroup, let time, let click) = mode {
            timer.upstream.connect().cancel()
            previewTimer.upstream.connect().cancel()
            self.clicksLeft = click
            self.previewTimeLeft = PlayViewModel.PREVIEW_TIME
            self.timeLeft = { if let time = time{ return time * PlayViewModel.MILLISECOND}; return time }()
            self.groupSolved = 0
            if first {
                for _ in 0..<groupLength {
                    for j in 0..<numOfGroup {
                        cards.append(Card(icon: j))
                    }
                }
            } else {
                for index in 0..<cards.count {
                    cards[index].state = .FACE_DOWN
                }
            }
            state = .INIT
        }
    }

    
    // changes state to preview
    private func toPreviewState() {
        if case .INIT = state {
            state = .PREVIEW
            for index in 0..<cards.count {
                cards[index].state = .FACE_UP
            }
            previewTimer = Timer.publish(every: TimeInterval(Float(PlayViewModel.TIME_INTERVAL) / Float(PlayViewModel.MILLISECOND)),
                                         on: .main,
                                         in: .common).autoconnect()
        }
    }
    
    // changes state to play
    private func toPlayState() {
        if case .INIT = state{
            playBlock()
        } else if case .PREVIEW = state {
            playBlock()
        }
        func playBlock() {
            for index in 0..<cards.count {
                cards[index].state = .FACE_DOWN
            }
            state = .PLAY
            timer = Timer.publish(every: TimeInterval(Float(PlayViewModel.TIME_INTERVAL) / Float(PlayViewModel.MILLISECOND)), on: .main, in: .common).autoconnect()
        }
    }
    
    // changes staet to over
    private func toOverState() {
        if case .PLAY = state {
            if case .MODE(_, _, let numOfGroup, _, _) = mode {
                state = .OVER(won: groupSolved == numOfGroup)
            }
            timer.upstream.connect().cancel()
        }
    }
    
    // MARK: helpers
    
    func timerOnEachInterval() {
        if case .PLAY = state {
            if let timeLeft = timeLeft {
                if timeLeft > 0 {
                    self.timeLeft = timeLeft - PlayViewModel.TIME_INTERVAL
                } else {
                    self.timeLeft = 0
                    toOverState()
                }
            }
        }
    }
    
    func previewTimerOnEachInterval() {
        if case .PREVIEW = state {
            if let previewTimeLeft = previewTimeLeft {
                if previewTimeLeft > 0 {
                    self.previewTimeLeft = previewTimeLeft - PlayViewModel.TIME_INTERVAL
                } else {
                    self.previewTimeLeft = 0
                    previewTimer.upstream.connect().cancel()
                    toPlayState()
                }
            }
        }
    }
    /**
    checks if card index should be made active
     
     - Parameter index -  index to be inserted
     */
    private func addToActive(index: Int) {
        // reduce clicks left by one
        if let clicksLeft = clicksLeft {
            if clicksLeft > 0 {
                self.clicksLeft = clicksLeft - 1
            }
        }
        
        if case .MODE(let groupLength, _, _, _, _) = mode {
            // checks if the last 2 active cards are differnt
            // if so remove all actie cards
            if actives.count > 1 && cards[actives[actives.count - 2]].icon != cards[actives[actives.count - 1]].icon {
                for active in actives {
                    cards[active].state = .FACE_DOWN
                }
                actives.removeAll()
            }
            
            // make card index axtive
            actives.append(index)
            cards[index].state = .FACE_UP
            
            // check if the last 2 active cards are different and active size is equal to group length
            // if so remove all active cards and increase the number to group solved by 1
            if !(actives.count > 1 &&
                cards[actives[actives.count - 2]].icon != cards[actives[actives.count - 1]].icon) &&
                actives.count == groupLength {
                for active in actives {
                    cards[active].state = .SOLVED
                }
                groupSolved = groupSolved + 1
                actives.removeAll()
            }
        }
    }
}
