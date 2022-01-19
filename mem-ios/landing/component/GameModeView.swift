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
    var numOfGroup: Int
    var preview: Bool
    var clickLimit: Int?
    var timeLimit: Int?
    
    var body: some View {
        VStack{
            HStack(alignment: .center){
                InfoView(
                    number: groupLength,
                    image: "ic_group_length"
                )
                Spacer()
                InfoView(
                    number: nil,
                    image: "ic_preview"
                )
                Spacer()
                InfoView(
                    number: numOfGroup,
                    image: "ic_num_of_group"
                )
            }
            Spacer()
            HStack(alignment: .center){
                if clickLimit != nil {
                    InfoView(
                        number: clickLimit,
                        image: "ic_time_limit"
                    )
                }
                Spacer()
                if timeLimit != nil {
                    InfoView(
                        number: timeLimit,
                        image: "ic_click_limit"
                    )
                }
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
    
    var body: some View {
        HStack(alignment: .center, spacing: 0.0) {
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


struct GameModeWidgetViewPreview: PreviewProvider {
    static var previews: some View {

        InfoView(
            number: 2,
            image: "ic_group_length"
        )
        .previewLayout(.sizeThatFits)
        
        InfoView(
            number: nil,
            image: "ic_preview"
        )
        .previewLayout(.sizeThatFits)
        
        InfoView(
            number: nil,
            image: "ic_no_preview"
        )
        .previewLayout(.sizeThatFits)
        
        InfoView(
            number: 2,
            image: "ic_num_of_group"
        )
        .previewLayout(.sizeThatFits)
        
        InfoView(
            number: 2,
            image: "ic_time_limit"
        )
        .previewLayout(.sizeThatFits)
        
        InfoView(
            number: 2,
            image: "ic_click_limit"
        )
        .previewLayout(.sizeThatFits)
        
        MenuOptionView {
        } content: {
            GameModeView(
                groupLength: 3,
                numOfGroup: 2,
                preview: false,
                clickLimit: 2,
                timeLimit: 3
            )
        }
        .previewDisplayName("game mode menu option")
                                .preferredColorScheme(.dark)
            .frame(width: 145.0, height: 145.0)
            .previewLayout(.sizeThatFits)

        GameModeView(
            groupLength: 3,
            numOfGroup: 2,
            preview: true,
            clickLimit: nil,
            timeLimit: nil
        )
            .previewDisplayName("menu option game mode")
            .preferredColorScheme(.light)
            .frame(width: 145.0, height: 145.0)
            .previewLayout(.sizeThatFits)
    }
}
