//
//  AddGame.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/18/22.
//

import SwiftUI

/**
Add Game component
 
 */
struct AddGame: View {
    var image = "ic_add_game"
    
    var body: some View {
        Image(image)
            .renderingMode(.template)
            .foregroundColor(Color(UIColor.label))
    }
}

struct AddGamePreview: PreviewProvider {
    static var previews: some View {
        AddGame()
            .padding(.all)
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
            .previewDisplayName("add game")
    }
}

struct MenuOptionAddGamePreview: PreviewProvider {
    static var previews: some View {
        MenuOption(
            onClick: {
                
            }, content: {
                AddGame()
            }
        )
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .previewDisplayName("menu option addd game")
    }
}
