//
//  TitleView.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/21/22.
//

import SwiftUI

/**
- Parameter title - title text
- Parameter icon - icon resource
- Parameter tint - tint color
 */
struct TitleView: View {
    let title: String
    let icon: String
    let tint: Color
    
    var body: some View {
        TextIconView(
            text: title.uppercased(),
            icon: icon,
            fontSize: 42.0,
            fontWeight: .medium,
            tint: tint,
            iconSize: titleViewImageSize,
            space: titleViewSpaceBetween
        )
    }
}

struct TitleViewPreviews: PreviewProvider {
    static var previews: some View {
        TitleView(
            title: NSLocalizedString("memory", comment: ""),
            icon: "ic_add_game",
            tint: Color(UIColor.label)
        ).preferredColorScheme(.light)
        .previewLayout(.sizeThatFits)
    }
}
