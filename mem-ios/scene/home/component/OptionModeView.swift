//
//  GameModeView.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/19/22.
//

import SwiftUI

/**
 game mode view
 
 - Parameter groupLength - length of one group
 - Parameter numOfGroup - number of groups
 - Parameter preview - if board will be preview at the start
 - Parameter clickLimit - max number of click
 - Parameter timeLimit - time limit to solve
 */
struct OptionModeView: View {
    let mode: OptionType
    var tint: Color = Color(UIColor.label)
    
    var body: some View {
        if case .Mode(
            let groupLenght,
            let preview,
            let numOfGroup,
            let timeLimit,
            let clickLimit
        ) = mode{
            
        VStack{
            HStack(alignment: .center){
                TextIconView(
                    text: "\(groupLenght)",
                    icon: "ic_group_length",
                    fontSize: 17.0,
                    tint: tint,
                    iconSize: 17.0
                )
                Spacer()
                TextIconView(
                    text: nil,
                    icon: preview ? "ic_preview" : "ic_no_preview",
                    tint: tint
                )
                Spacer()
                TextIconView(
                    text: "\(numOfGroup)",
                    icon: "ic_num_of_group",
                    fontSize: 17.0,
                    tint: tint,
                    iconSize: 17.0
                )
            }
            Spacer()
            HStack(alignment: .center){
                TextIconView(
                    text: {
                        if timeLimit == nil{
                           return nil
                        }
                        return "\(timeLimit ?? 0)"
                    }(),
                    icon: "ic_time_limit",
                    fontSize: 17.0,
                    tint: tint,
                    iconSize: 17.0,
                    visible: timeLimit != nil
                )
                Spacer()
                TextIconView(
                    text: {
                        if clickLimit == nil{
                           return nil
                        }
                        return "\(clickLimit ?? 0)"
                    }(),
                    icon: "ic_click_limit",
                    fontSize: 17.0,
                    tint: tint,
                    iconSize: 17.0,
                    visible: clickLimit != nil
                )
            }
        }
        .padding(.all, gameModePaddingViewPadding)
        }
    }
}

struct GameModeWidgetViewPreview: PreviewProvider {
    static var previews: some View {
        OptionContentView(
            backgroundColor: .clear,
            tint: Color(UIColor.label),
            onClick: {},
            onHold: {}
        ){
            OptionModeView(mode: .Mode(
                groupLength: 3,
                preview: false,
                numOfGroup: 2,
                timeLimit: nil,
                clickLimit: 2
            ))
        }
        .previewDisplayName("game mode menu option")
            .preferredColorScheme(.dark)
            .frame(width: 145.0, height: 145.0)
            .previewLayout(.sizeThatFits)

        OptionModeView(mode: .Mode(
            groupLength: 3,
            preview: false,
            numOfGroup: 2,
            timeLimit: nil,
            clickLimit: 2
        ))
            .previewDisplayName("menu option game mode")
            .preferredColorScheme(.dark)
            .frame(width: 145.0, height: 145.0)
            .previewLayout(.sizeThatFits)
    }
}
