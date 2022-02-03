//
//  PlayScreen.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/22/22.
//

import SwiftUI

struct PlayScreen: View {
    let mode: OptionType
    @ObservedObject private var viewModel: PlayViewModel
    
    init(mode: OptionType){
        self.mode = mode
        self.viewModel = PlayViewModel(
            mode: mode,
            tint: Color(UIColor.label)
        )
    }
    var body: some View {
        GeometryReader{reader in
            ZStack(alignment: .bottomTrailing){
                if case .Mode(_,_,_,let timeLimit,_) = viewModel.mode {
                    if viewModel.timeLeft != nil && timeLimit != nil {
                        let height: CGFloat = reader.size.height * (CGFloat(viewModel.timeLeft ?? 1) / CGFloat(timeLimit ?? 1))
                    
                        Rectangle()
                            .fill(viewModel.tint.opacity(0.05))
                            .frame(width: reader.size.width, height: height)
                        
                    }
                }
                
                
                VStack(alignment: .center){
                    Spacer().frame(height: screenFirstSpacer)
                    HeaderView(
                        clickLimit: viewModel.clicksLeft,
                        timeLimit: viewModel.timeLeft,
                        onReset: {},
                        tint: viewModel.tint
                    )
                    Spacer().frame(height: screenSecondSpacer)
                    
                    GridView(size: viewModel.icons.count
                    ){ index in
                        OptionContentView(
                            backgroundColor: viewModel.tint.opacity(0.05),
                            tint: viewModel.tint,
                            onClick: {
                            },
                            onHold: {}
                        ){
                            OptionImageView(
                                icon: viewModel.getIconAt(index: index),
                                tint: Color(UIColor.label)
                            )
                        }
                    }
                    .padding(.bottom, 40.0)
                    
                }.padding(.horizontal, screenPadding)
            }
        }.ignoresSafeArea()
    }
}

struct PlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayScreen(mode: .Mode(
            groupLength: 3,
            preview: false,
            numOfGroup: 2,
            timeLimit: 2,
            clickLimit: 2
            )
        )
            .preferredColorScheme(.dark)
    }
}
