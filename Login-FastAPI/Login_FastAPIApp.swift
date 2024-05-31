//
//  Login_FastAPIApp.swift
//  Login-FastAPI
//
//  Created by Carlos on 5/17/24.
//

import SwiftUI

@main
struct Login_FastAPIApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
