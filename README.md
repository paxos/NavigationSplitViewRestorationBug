<img width="1202" alt="Screenshot 2024-03-07 at 19 16 09" src="https://github.com/paxos/NavigationSplitViewRestorationBug/assets/121539/6e6cb635-f518-4046-9b3f-938c2e7fe571">

Demonstrates an issue where the toolbar of a NavigationSplitView looks scrambled when SwiftUI does a window restoration.

To reproduce:
- Make sure window restoration is tuned on in system settings ("Close windows when quitting an application" needs to be off)
- Open app
- click "Open Window A" button
- click "Open Window B" button
- See two windows that look correct
- Close app (CMD+Q)
- Open app again: one window toolbar is scrambled (divider is at the wrong position).


This is 100% caused by setting an explicit ID on the view:
´´´swift
            ContentView()
                .id(value) // <-- issue
```


But: Without an explicit ID, @StateObject is incorrectly initiated multiple times.
