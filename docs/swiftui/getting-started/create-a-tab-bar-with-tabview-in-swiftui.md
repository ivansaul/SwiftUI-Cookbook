# Create a Tab Bar with TabView in SwiftUI

In SwiftUI, `TabView` is a powerful and flexible component that allows you to easily create a tab bar for navigating between multiple views. In this tutorial, we will explore how to use `TabView` to create a modern and fluid user experience.

### Basic `TabView` Example

To start, let's look at a basic example of how to create a `TabView`.

```swift
TabView {
    Text("Tab 1")
    Text("Tab 2")
}
```

In this example, we are simply adding two text views as tabs. Each view will become a tab within the `TabView`.

### Adding Tabs to the Tab Bar

To add visual elements and labels to the tabs, we use the `tabItem` modifier.

```swift
TabView {
    Text("Home Tab")
        .tabItem {
            Image(systemName: "house")
            Text("Home")
        }
    Text("Settings Tab")
        .tabItem {
            Image(systemName: "gear")
            Text("Settings")
        }
}
```

In this case, each tab includes an icon and text that will appear in the tab bar. This makes the tabs more intuitive and easier to navigate.

<figure><img src="../../.gitbook/assets/Screenshot 2024-06-25 at 9.05.17 PM.png" alt=""><figcaption><p>Adding Tabs to Tab Bar</p></figcaption></figure>

### Changing the Tab Bar Appearance

We can further customize the appearance of the tab bar using the `tint` modifier.

```swift
TabView {
    Text("Home Tab")
        .tabItem {
            Image(systemName: "house")
            Text("Home")
        }
    Text("Settings Tab")
        .tabItem {
            Image(systemName: "gear")
            Text("Settings")
        }
}
.tint(.orange)
```

The `.tint(.orange)` modifier changes the color of the currently selected tab item. To modify the background color of the tab bar, we need to use `UITabBar.appearance()`.

```swift
struct TabViewSwiftUI: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.lightGray
    }

    var body: some View {
        TabView {
            Text("Home Tab")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            Text("Settings Tab")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}
```

In the example above, we change the background color of the tab bar to blue using `UITabBar.appearance().backgroundColor`.

<figure><img src="../../.gitbook/assets/Screenshot 2024-06-25 at 9.22.16 PM.png" alt=""><figcaption><p>Change Tab Bar Appearance</p></figcaption></figure>

### Navigating Between Tabs Programmatically

To label tabs and set which one is displayed initially, we use the `tag` modifier and the `selection` binding.

```swift
struct TabViewSwiftUI: View {
    @State var selectedTab: Int = 2
    var body: some View {
        TabView(selection: $selectedTab) {
            Text("Home Tab")
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)

            VStack {
                Text("Messages Tab")

                Button("Go Home") {
                    selectedTab = 0
                }
                .buttonStyle(.bordered)
            }
            .tabItem {
                Image(systemName: "message.badge")
                Text("Messages")
            }
            .tag(1)
            
            Text("Settings Tab")
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(2)
        }
    }
}
```

In this example, the tab with `tag(1)` will be displayed initially thanks to the `selectedTab` state binding. Additionally, we are using a `Button` to change the tab when the user taps on it.

<figure><img src="../../.gitbook/assets/Screenshot 2024-06-25 at 10.02.35 PM.png" alt=""><figcaption><p>Navigating Between Tabs</p></figcaption></figure>

### Changing the Tab Bar Style

We can use the `tabViewStyle` modifier to apply a different style to the tab bar.

```swift
struct TabViewSwiftUI: View {
    var body: some View {
        TabView {
            Color.red
                .ignoresSafeArea()
            Color.green
                .ignoresSafeArea()
            Color.blue
                .ignoresSafeArea()
        }
        .ignoresSafeArea()
        .tabViewStyle(PageTabViewStyle())
    }
}
```

In this example, we are using `PageTabViewStyle()` to create a tab bar that behaves like a page that can be swiped.

<figure><img src="../../.gitbook/assets/Screenshot 2024-06-26 at 1.06.05 AM.png" alt=""><figcaption><p>Changing TabViewStyle</p></figcaption></figure>
