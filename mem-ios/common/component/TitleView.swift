//
//  TitleView.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/21/22.
//

import SwiftUI

struct TitleView: View {
    let title: String
    let image: String
    
    var body: some View {
        HStack(alignment: .center, spacing: titleViewSpaceBetween) {
            Text(title.uppercased())
                .foregroundColor(Color(UIColor.label))
                .font(.largeTitle)
            Image(image)
                .renderingMode(.template)
                .foregroundColor(Color(UIColor.label))
        }
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView(title: NSLocalizedString("memory", comment: ""), image: "ic_no_preview")
            .preferredColorScheme(.light)
            .previewLayout(.sizeThatFits)
    }
}
