//
//  ContentView.swift
//  NavigationSplitViewRestorationBug
//
//  Created by Patrick Dinger on 07.03.2024.
//

import SwiftUI

@Observable
class MyState {
    var value: String

    init(value: String) {
        self.value = value
        print("MyState(\(value))")
    }
}

struct ContentView: View {
    @Environment(\.openWindow) private var openWindow

    @State private var myState: MyState
    let value: String

    init(value: String) {
//        print("ContentView called with \(value)")
        _myState = State(wrappedValue: MyState(value: value))
        self.value = value
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
       
        .onChange(of: value, {
            myState.value = value
        })
//        .onAppear {
//            print("\(value) vs \(myState.value)")
//            myState.value = value
//        }
       
    }
}

#Preview {
    ContentView(value: "demo")
}
