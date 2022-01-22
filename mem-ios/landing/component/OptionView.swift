//
//  OptionView.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/21/22.
//

import SwiftUI

/**
 option type
 */
enum OptionType: Hashable {
    case Mode(groupLenght: Int,
              preview: Bool,
              numOfGroup: Int,
              timeLimit: Int?,
              clickLimit: Int?
    )
    case Add
}

/**
 Option View
 
- Parameter options - list of optionType
- Parameter rowCount - size of row
- Parameter padding - element padding
*/
struct OptionView: View {
    let options: [OptionType]
    let bgColor: Color
    let rowCount: Int
    let onClick: (OptionType) -> Void
    let onHold: (OptionType) -> Void
    
    var body: some View {
        LazyVGrid(
            columns:  Array(repeating: .init(.flexible(minimum: 40), spacing: 0), count: rowCount),
            alignment: .center,
            spacing: 0
        ) {
            ForEach(options,id: \.self) { option in
                MenuOptionView(
                    bgColor: bgColor,
                    onClick: {
                        onClick(option)
                    },
                    onHold: {
                        onHold(option)
                    }
                ){
                    switch option {
                    case .Mode(
                        let groupLenght,
                        let preview,
                        let numOfGroup,
                        let clickLimit,
                        let timeLimit
                    ):
                        GameModeView(
                            groupLength: groupLenght,
                            preview: preview,
                            numOfGroup: numOfGroup,
                            timeLimit: timeLimit,
                            clickLimit: clickLimit
                        )
                    case .Add:
                        AddGameView()
                    }
                }.padding(.all, optionViewPadding)
                .aspectRatio(1.0, contentMode: .fill)
            }
        }
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionView(
            options: [
                OptionType.Add,
                OptionType.Mode(groupLenght: 2,  preview: false, numOfGroup: 2, timeLimit: 2, clickLimit: 2),
                OptionType.Mode(groupLenght: 1,  preview: false, numOfGroup: 2, timeLimit: 2, clickLimit: 2),
                OptionType.Mode(groupLenght: 1, preview: false, numOfGroup: 5, timeLimit: nil, clickLimit: nil),
            ],
            bgColor: .clear,
            rowCount: 2
        ) { option in
            
        } onHold: { option in
            
        }.preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)

    }
}
