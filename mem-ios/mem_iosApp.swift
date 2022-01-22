//
//  mem_iosApp.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/13/22.
//

import SwiftUI

@main
struct mem_iosApp: App {
    var body: some Scene {
        WindowGroup {
            LandingScreen()
                .environmentObject(LandingViewModel())
        }
    }
}
