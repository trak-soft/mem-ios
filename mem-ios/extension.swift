//
//  extension.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 3/2/22.
//

import SwiftUI

extension Color {
    init(hex: UInt) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 0xff,
            green: Double((hex >> 08) & 0xff) / 0xff,
            blue: Double((hex >> 00) & 0xff) / 0xff,
            opacity: Double((hex >> 24) & 0xff) / 0xff
        )
    }
}
