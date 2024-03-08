//
//  ContentView.swift
//  NavigationSplitViewRestorationBug
//
//  Created by Patrick Dinger on 07.03.2024.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.openWindow) private var openWindow

    var body: some View {
        NavigationSplitView {
            Text("Sidebar")
        } content: {
            Text("Content")
            Button("Open Window A", action: {
                openWindow(value: "A")
            })
            Button("Open Window B", action: {
                openWindow(value: "B")
            })
            .toolbar {
                ToolbarItem {
                    Text("ok")
                }
            }
        } detail: {
            Text("Detail")
                .toolbar {
                    ToolbarItem {
                        Text("ok")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
