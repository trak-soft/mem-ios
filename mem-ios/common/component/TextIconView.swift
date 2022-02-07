//
//  TextIconView.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/27/22.
//

import SwiftUI
import UIKit

/**
 - Parameter text - text to be displayed, if text is null show no text
 - Parameter icon - image to be displayed, if icon is null show no icon
 - Parameter fontSize - fontSize
 - Parameter fontWeight - font weight
 - Parameter letterSpacing - spacing between letter
 - Parameter tint - color of icon and image
 - Parameter iconSize - width and height of image, if image size is nulll image size is default image size
 - Parameter space - space between text and image
 - Parameter visible - is view visible
 */
struct TextIconView: View {
    var text: String?
    var icon: String?
    var fontSize: CGFloat? = nil
    var fontWeight: Font.Weight? = nil
    var letterSpacing: CGFloat? = nil
    var tint: Color? = nil
    var iconSize: CGFloat? = nil
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
                }
                Spacer().frame(width: space)
                if (icon != nil) {
                    let uiImageView = UIImageView(image: UIImage(named: icon ?? ""))
                    
                    Image(icon ?? "")
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(tint)
                        .frame(
                            width: iconSize ?? uiImageView.frame.width,
                            height: iconSize ?? uiImageView.frame.height,
                            alignment: .center
                        )
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
