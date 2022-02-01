//
//  HeaderView.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/29/22.
//

import SwiftUI

struct HeaderView: View {
    var clickLimit: Int
    var timeLimit: Int
    var onReset: () -> Void
    var tint: Color

    var body: some View {
        HStack(alignment: VerticalAlignment.center) {
            TextIconView(
                text: "\(clickLimit)",
                icon: "ic_click_limit",
                fontSize: 32.0,
                tint: tint,
                iconSize: 32.0
            )
            Spacer()
            Image("ic_reset")
                .renderingMode(.template)
                .onTapGesture {
                    onReset()
                }
            Spacer()
            TextIconView(
                text: "\(timeLimit)",
                icon: "ic_time_limit",
                fontSize: 32.0,
                tint: tint,
                iconSize: 32.0
            )
        }
    }
}

struct HeaderViewPreviews: PreviewProvider {
    static var previews: some View {
        HeaderView(
            clickLimit: 32,
            timeLimit: 12,
            onReset: {
            
            },
            tint: Color(UIColor.label)
        )
    }
}
