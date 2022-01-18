//
//  MenuOption.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/18/22.
//

import SwiftUI

/**
 Generalize Menu Option View Component
 
 draws the outline of the composable and take in a view content
 making menuOption more reussable
 
 - Parameter width: width of view
 - Parameter height: height of view
 - Parameter bgColor: backgorund color of view
 - Parameter onClick: child view
 */
struct MenuOption<Content : View>: View {
    
    var width = 145.0
    var height = 145.0
    let bgColor: Color = .gray
    let onClick: () -> Void
    @ViewBuilder let  content: () -> Content
    
    var body: some View {
        Button {
            onClick()
        }label: {
            content()
        }
        .frame(width: width, height: height)
        .overlay(
            RoundedRectangle(cornerRadius: menuOptionRoundedCornerRadius)
                .stroke(Color(UIColor.label), lineWidth: menuOptionBoarderWidth)
        )
        .background(bgColor)
        .cornerRadius(menuOptionRoundedCornerRadius)
    }
}

struct MenuOptionPreview: PreviewProvider {
    static var previews: some View {
        MenuOption(
            onClick: {
                
            }, content: {

            }
        )
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}
