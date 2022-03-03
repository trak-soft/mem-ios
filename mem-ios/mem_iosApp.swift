//
//  mem_iosApp.swift
//  mem-ios
//
//  Created by Emmanuel Kareem on 1/13/22.
//

import SwiftUI

@main
struct mem_iosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            NavigationView{
                HomeScreen()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    //lock apps orientation to portrait
    static var orientationLock = UIInterfaceOrientationMask.portrait
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // something to do
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window:UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }
}
