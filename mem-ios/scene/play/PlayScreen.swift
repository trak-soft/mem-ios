//
//  PlayScreen.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/22/22.
//

import SwiftUI

/**
 play screen
 */
struct PlayScreen: View {
    let mode: OptionType
    @ObservedObject private var viewModel: PlayViewModel
    
    init(mode: OptionType) {
        self.mode = mode
        self.viewModel = PlayViewModel(
            mode: mode,
            tint: Color(UIColor.label)
        )
    }
    var body: some View {
        if case .Mode(_,_,_,let timeLimit,_) = viewModel.mode {
            GeometryReader{reader in
                ZStack(alignment: .bottomTrailing) {
                        if let timeLeft = viewModel.timeLeft, let timeLimit = timeLimit {
                            let height: CGFloat = reader.size.height * (CGFloat(timeLeft) / CGFloat(timeLimit * PlayViewModel.MILLISECOND))
                        
                            Rectangle()
                                .fill(viewModel.tint.opacity(0.05))
                                .frame(width: reader.size.width, height: height)
                            
                        }
                    
                    VStack(alignment: .center) {
                        Spacer().frame(height: screenFirstSpacer)
                        HeaderView(
                            clickLimit: viewModel.clicksLeft,
                            timeLimit: {
                                if let timeleft = viewModel.timeLeft{
                                    return Int(ceilf(Float(timeleft) / Float(PlayViewModel.MILLISECOND)))
                                }
                                return viewModel.timeLeft
                            }(),
                            onReset: {},
                            tint: viewModel.tint
                        )
                        
                        Spacer().frame(height: screenSecondSpacer)
                        
                        GridView(size: viewModel.cards.count
                        ) { index in
                            OptionContentView(
                                backgroundColor: viewModel.tint.opacity(0.05),
                                tint: viewModel.tint,
                                onClick: {
                                    viewModel.onEvent(event:.CardClick(index: index))
                                },
                                onHold: {}
                            ) {
                                Text(getIcon(index)).frame(alignment: .center)
                            }
                        }
                        
                    }.padding(.horizontal, screenPadding)
                    .padding(.bottom, screenBottomPadding)
                }.ignoresSafeArea()
                    .onReceive(viewModel.timer) { time in
                        if let timeLeft = viewModel.timeLeft {
                            if timeLeft > 0 {
                                viewModel.timeLeft = timeLeft - PlayViewModel.TIME_INTERVAL
                            }
                        }
                    }
            }.ignoresSafeArea()
        }
    }
    
    private func getIcon(_ index: Int) -> String {
        switch viewModel.cards[index].state {
        case .FACE_UP: return String(viewModel.cards[index].icon)
        case .FACE_DOWN: return "-1"
        case .SOLVED: return String(viewModel.cards[index].icon)
        }
    }
}

struct PlayScreenPreviews: PreviewProvider {
    static var previews: some View {
        PlayScreen(mode: .Mode(
            groupLength: 3,
            preview: false,
            numOfGroup: 2,
            timeLimit: 20,
            clickLimit: 20
            )
        )
            .preferredColorScheme(.dark)
    }
}
