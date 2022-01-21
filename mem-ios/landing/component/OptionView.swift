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
              numOfGroup: Int,
              preview: Bool,
              clickLimit: Int?,
              timeLimit: Int?
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
    var rowCount: Int = 2
    var padding: Int  = 15
    
    var body: some View {
        LazyVGrid(
            columns:  Array(repeating: .init(.flexible(minimum: 40), spacing: 0), count: rowCount),
            alignment: .center,
            spacing: 0
        ) {
            ForEach(options,id: \.self) { option in
                MenuOptionView(
                    onClick: {
                        switch option {
                        case .Mode(
                            let groupLenght,
                            let numOfGroup,
                            let preview,
                            let clickLimit,
                            let timeLimit
                        ):
                            break
                        case .Add:
                            break
                        }
                    }, content: {
                        switch option {
                        case .Mode(
                            let groupLenght,
                            let numOfGroup,
                            let preview,
                            let clickLimit,
                            let timeLimit
                        ):
                            GameModeView(
                                groupLength: groupLenght,
                                numOfGroup: numOfGroup,
                                preview: preview,
                                clickLimit: clickLimit,
                                timeLimit: timeLimit
                            )
                        case .Add:
                            AddGameView()
                        }
                    }
                ).padding(.all, 15.0)
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
                OptionType.Mode(groupLenght: 2, numOfGroup: 2, preview: false, clickLimit: 2, timeLimit: 2),
                OptionType.Mode(groupLenght: 1, numOfGroup: 2, preview: false, clickLimit: 2, timeLimit: 2),
                OptionType.Mode(groupLenght: 1, numOfGroup: 5, preview: false, clickLimit: nil, timeLimit: nil),
            ]
        )
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
