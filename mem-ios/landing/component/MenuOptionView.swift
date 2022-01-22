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
    
    let bgColor: Color
    let onClick: () -> Void
    let onHold: () -> Void
    @ViewBuilder let  content: () -> Content
    @State private var longPress: Bool = false
    
    var body: some View {
        Button {
            if longPress{
                onHold()
                longPress.toggle()
            }
            else{
                onClick()
                
            }
        }label: {
            content()
        }
        .frame(
              minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: .center
            )
        .overlay(
            RoundedRectangle(cornerRadius: menuOptionRoundedCornerRadius)
                .stroke(Color(UIColor.label), lineWidth: menuOptionBoarderWidth)
        )
        .simultaneousGesture(
            LongPressGesture(minimumDuration: 0.1).onEnded({ _ in
                self.longPress = true
            })
        )
        .background(bgColor)
        .cornerRadius(menuOptionRoundedCornerRadius)
    }
}

struct MenuOptionVeiwPreview: PreviewProvider {
    static var previews: some View {
        MenuOptionView(
            bgColor: .clear,
            onClick: {},
            onHold: {},
            content: {}
        )
        .frame(width: 145.0, height: 145.0)
        .previewLayout(.sizeThatFits)
        .preferredColorScheme(.light)
        .padding(.all)
    }
}
