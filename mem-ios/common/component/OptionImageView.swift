//
//  AddGame.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/18/22.
//

import SwiftUI

/**
Add Game component
 
 - Parameter icon - icon resource
 - Parameter tint - tint color
 */
struct OptionImageView: View {
    var icon: String
    var tint: Color
    var body: some View {
        Image(icon)
            .renderingMode(.template)
            .foregroundColor(tint)
    }
}

struct OptionImageViewPreview: PreviewProvider {
    static var previews: some View {
        OptionImageView(
            icon: "ic_add_game",
            tint: Color(UIColor.label)
        ).padding(.all)
        .preferredColorScheme(.light)
        .previewLayout(.sizeThatFits)
        .previewDisplayName("add game")
    }
}

struct MenuOptionAddGamePreview: PreviewProvider {
    static var previews: some View {
        OptionContentView(
            backgroundColor: .clear,
            tint: Color(UIColor.label),
            onClick: {},
            onHold: {},
            content: {
                OptionImageView(
                    icon: "ic_add_game",
                    tint: Color(UIColor.label)
                )
            }
        ).frame(width: 145.0, height: 145.0)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
        .previewDisplayName("menu option addd game")
    }
}
