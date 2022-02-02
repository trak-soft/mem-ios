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
            ZStack{
                if case .Mode(
                    let groupLength,
                    _,
                    let numOfGroup,
                    let timeLimit,
                    let click
                ) = viewModel.mode {
                    if viewModel.timeLeft != nil && timeLimit != nil{
                        var ratio: CGFloat = CGFloat(viewModel.timeLeft ?? 1) / CGFloat(timeLimit ?? 1)
                        //ratio * reader.size.height
                        Rectangle()
                            .fill(viewModel.tint.opacity(0.05))
                            .frame(width: reader.size.width, height: 200, alignment: .bottomTrailing)
                        
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
                    
                }.padding(.horizontal, screenPadding)
                .offset( y: screenNavOffsetY)
            }
        }
    }
}

struct PlayScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlayScreen(mode: .Mode(
            groupLength: 3,
            preview: false,
            numOfGroup: 2,
            timeLimit: nil,
            clickLimit: 2
            )
        )
    }
}
