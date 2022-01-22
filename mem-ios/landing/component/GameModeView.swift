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
struct GameModeView: View {
    var groupLength: Int
    var preview: Bool
    var numOfGroup: Int
    var timeLimit: Int?
    var clickLimit: Int?
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                InfoView(
                    number: groupLength,
                    image: "ic_group_length",
                    visible: true
                )
                Spacer()
                InfoView(
                    number: nil,
                    image: "ic_preview",
                    visible: true
                )
                Spacer()
                InfoView(
                    number: numOfGroup,
                    image: "ic_num_of_group",
                    visible: true
                )
            }
            Spacer()
            HStack(alignment: .center){
                InfoView(
                    number: timeLimit,
                    image: "ic_time_limit",
                    visible: timeLimit != nil
                )
                Spacer()
                InfoView(
                    number: clickLimit,
                    image: "ic_click_limit",
                    visible: clickLimit != nil
                )
            }
        }
        .padding(.all, gameModePaddingViewPadding)
    }
}

/**
 - Parameter number - number of info
 - Parameter image - info image
 */
struct InfoView: View {
    let number: Int?
    let image: String
    let visible: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 0.0) {
            if visible {
                if (number != nil) {
                    Text("\(number ?? 0)")
                        .foregroundColor(Color(UIColor.label))
                }
                Image(image)
                    .renderingMode(.template)
                    .foregroundColor(Color(UIColor.label))
            }
        }
    }
}


struct GameModeWidgetViewPreview: PreviewProvider {
    static var previews: some View {

        InfoView(
            number: 2,
            image: "ic_group_length",
            visible: true
        )
        .previewLayout(.sizeThatFits)
        
        InfoView(
            number: nil,
            image: "ic_preview",
            visible: true
        )
        .previewLayout(.sizeThatFits)
        
        InfoView(
            number: nil,
            image: "ic_no_preview",
            visible: true
        )
        .previewLayout(.sizeThatFits)
        
        InfoView(
            number: 2,
            image: "ic_num_of_group",
            visible: true
        )
        .previewLayout(.sizeThatFits)
        
        InfoView(
            number: 2,
            image: "ic_time_limit",
            visible: true
        )
        .previewLayout(.sizeThatFits)
        
        InfoView(
            number: 2,
            image: "ic_click_limit",
            visible: true
        )
        .previewLayout(.sizeThatFits)
        
        MenuOptionView(
            bgColor: .clear,
            onClick: {},
            onHold: {}
        ){
            GameModeView(
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

        GameModeView(
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
