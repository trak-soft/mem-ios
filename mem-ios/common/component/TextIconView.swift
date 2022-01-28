//
//  TextIconView.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/27/22.
//

import SwiftUI
import UIKit

/**
 - Parameter number - number of info
 - Parameter image - info image
 */
struct TextIconView: View {
    var text: String?
    var icon: String?
    var fontSize: CGFloat? = nil
    var fontWeight: Font.Weight? = nil
    var letterSpacing: CGFloat? = nil
    var tint: Color? = nil
    var imageSize: CGFloat? = nil
    var space: CGFloat = 0.0
    var visible: Bool = true
    
    
    var body: some View {
        HStack(alignment: .center, spacing: 0.0) {
            if visible {
                if (text != nil) {
                    Text(text ?? "")
                        .foregroundColor(tint)
                        .font(.system(size: fontSize ?? 20.0))
                        .fontWeight(fontWeight)
                        .tracking(letterSpacing ?? 0.15)
                        //.foregroundColor(Color(UIColor.label))
                }
                Spacer().frame(width: space)
                if (icon != nil){
                    let uiImageView = UIImageView(image: UIImage(named: icon ?? ""))
                    
                    Image(icon ?? "")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(tint)
                        .frame(width: imageSize ?? uiImageView.frame.width, height: imageSize ?? uiImageView.frame.height, alignment: .center)
                        
                }
            }
        }
    }
}

struct TextIconViewPreview: PreviewProvider {
    static var previews: some View {

        TextIconView(
            text: "2",
            icon: "ic_group_length",
            visible: true
        )
        .previewLayout(.sizeThatFits)
        
        TextIconView(
            text: nil,
            icon: "ic_preview",
            visible: true
        )
        .previewLayout(.sizeThatFits)
        
        TextIconView(
            text: nil,
            icon: "ic_no_preview",
            visible: true
        )
        .previewLayout(.sizeThatFits)
        
        TextIconView(
            text: "2",
            icon: "ic_num_of_group",
            visible: true
        )
        .previewLayout(.sizeThatFits)
        
        TextIconView(
            text: "2",
            icon: "ic_time_limit",
            visible: true
        )
        .previewLayout(.sizeThatFits)
        
        TextIconView(
            text: "2",
            icon: "ic_click_limit",
            visible: true
        )
        .previewLayout(.sizeThatFits)
    }
}
