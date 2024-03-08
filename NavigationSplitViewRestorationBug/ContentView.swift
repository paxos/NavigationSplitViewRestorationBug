//
//  ContentView.swift
//  NavigationSplitViewRestorationBug
//
//  Created by Patrick Dinger on 07.03.2024.
//

import SwiftUI

class MyState: ObservableObject {
    let value: String

    init(value: String) {
        self.value = value
        print("MyState()")
    }
}

struct ContentView: View {
    @Environment(\.openWindow) private var openWindow

    @StateObject private var myState: MyState

    init(value: String) {
        _myState = StateObject(wrappedValue: MyState(value: value))
    }

    var body: some View {
        NavigationSplitView {
            Text("Sidebar")
        } content: {
            Text(myState.value)
                .font(.title)
            Button("Open Window A", action: {
                openWindow(value: "A")
            })
            Button("Open Window B", action: {
                openWindow(value: "B")
            })
            Button("Open Window C", action: {
                openWindow(value: "C")
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
    ContentView(value: "demo")
}
