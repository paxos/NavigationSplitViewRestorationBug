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
            ContentView()

                .id(value)
        } defaultValue: {
            "A"
        }
    }
}
