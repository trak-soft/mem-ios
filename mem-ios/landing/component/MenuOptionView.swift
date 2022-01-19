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
struct MenuOptionView<Content : View>: View {
    
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
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .topLeading
            )
        .overlay(
            RoundedRectangle(cornerRadius: menuOptionRoundedCornerRadius)
                .stroke(Color(UIColor.label), lineWidth: menuOptionBoarderWidth)
        )
        .background(bgColor)
        .cornerRadius(menuOptionRoundedCornerRadius)
    }
}

struct MenuOptionVeiwPreview: PreviewProvider {
    static var previews: some View {
        MenuOptionView(
            onClick: {
                
            }, content: {

            }
        )
        .frame(width: 145.0, height: 145.0)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
        .padding(.all)
    }
}
