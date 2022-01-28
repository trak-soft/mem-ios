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
    var groupLength: Int
    var preview: Bool
    var numOfGroup: Int
    var timeLimit: Int?
    var clickLimit: Int?
    var tint: Color = Color(UIColor.label)
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                TextIconView(
                    text: "\(groupLength)",
                    icon: "ic_group_length",
                    tint: tint,
                    visible: true
                )
                Spacer()
                TextIconView(
                    text: nil,
                    icon: "ic_preview",
                    tint: tint,
                    visible: true
                )
                Spacer()
                TextIconView(
                    text: "\(numOfGroup)",
                    icon: "ic_num_of_group",
                    tint: tint,
                    visible: true
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
                    tint: tint,
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
                    tint: tint,
                    visible: clickLimit != nil
                )
            }
        }
        .padding(.all, gameModePaddingViewPadding)
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
            OptionModeView(
                groupLength: 3,
                preview: false,
                numOfGroup: 2,
                timeLimit: nil,
                clickLimit: 2
            )
        }
        .previewDisplayName("game mode menu option")
            .preferredColorScheme(.dark)
            .frame(width: 145.0, height: 145.0)
            .previewLayout(.sizeThatFits)

        OptionModeView(
            groupLength: 3,
            preview: true,
            numOfGroup: 2,
            timeLimit: 2,
            clickLimit: nil
        )
            .previewDisplayName("menu option game mode")
            .preferredColorScheme(.dark)
            .frame(width: 145.0, height: 145.0)
            .previewLayout(.sizeThatFits)
    }
}
