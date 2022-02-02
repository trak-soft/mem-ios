//
//  OptionView.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/21/22.
//

import SwiftUI

/**
 Option View
 
- Parameter options - list of optionType
- Parameter rowCount - size of row
- Parameter padding - element padding
*/
struct OptionsView: View {
    var options: [OptionType]
    let rowCount: Int
    var backgroundColor: Color
    var tint: Color
    let onClick: (OptionType) -> Void
    let onHold: (OptionType) -> Void
    
    var body: some View {
        LazyVGrid(
            columns:  Array(repeating: .init(.flexible(minimum: 40), spacing: 0), count: rowCount),
            alignment: .center,
            spacing: 0
        ) {
            ForEach(options,id: \.self) { option in
                OptionContentView(
                    backgroundColor: backgroundColor,
                    tint: tint,
                    onClick: {
                        onClick(option)
                    },
                    onHold: {
                        onHold(option)
                    }
                ){
                    switch option {
                    case .Mode:
                        OptionModeView(
                            mode: option,
                            tint: tint
                        )
                    case .Add:
                        OptionImageView(
                            icon: "ic_add_game",
                            tint: tint
                        )
                    }
                }.padding(.all, optionViewPadding)
                .aspectRatio(1.0, contentMode: .fill)
            }
        }
    }
}

struct OptionView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView(
            options: [
                OptionType.Add,
                OptionType.Mode(groupLength: 2,  preview: false, numOfGroup: 2, timeLimit: 2, clickLimit: 2),
                OptionType.Mode(groupLength: 1,  preview: false, numOfGroup: 2, timeLimit: 2, clickLimit: 2),
                OptionType.Mode(groupLength: 3,  preview: false, numOfGroup: 2, timeLimit: 2, clickLimit: 2)
            ],
            rowCount: 2,
            backgroundColor: .clear,
            tint: Color(UIColor.label)
        ) { option in
            
        } onHold: { option in
            
        }.previewLayout(.sizeThatFits).preferredColorScheme(.dark)

    }
}
