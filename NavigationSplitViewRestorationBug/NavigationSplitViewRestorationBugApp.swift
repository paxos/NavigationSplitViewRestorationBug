//
//  NavigationSplitViewRestorationBugApp.swift
//  NavigationSplitViewRestorationBug
//
//  Created by Patrick Dinger on 07.03.2024.
//

import SwiftUI

@main
struct NavigationSplitViewRestorationBugApp: App {
    var body: some Scene {
        
        WindowGroup(for: String.self) { $value in
            print("ContentView(\(value))")
            return ContentView(value: value)
//                .id(value)
        } defaultValue: {
            // It seems each window is restored with the default value, and then the value is actually set after
            "A"
        }
    }
}
