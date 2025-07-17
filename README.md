# SwiftUI .task() vs .onAppear() Demo

A practical SwiftUI demonstration app that showcases the differences between `.task()` and `.onAppear()` view modifiers through a live cat facts streaming example.

## 📖 About

This project accompanies the article **"Understanding When to Use .task() vs .onAppear in SwiftUI"** published on [Clement's Substack](https://clementlumumba.substack.com/p/understanding-when-to-use-task-vs).

## ✨ Features

- **Live Cat Facts Stream**: Demonstrates `.task()` modifier with continuous data streaming
- **Automatic Task Management**: Shows automatic cancellation when view disappears
- **AsyncStream Implementation**: Real-world example of async/await in SwiftUI
- **Clean Architecture**: Simple, educational code structure

## 🚀 What You'll Learn

### `.onAppear()` - Standard View Modifier
- Performs **synchronous** actions when a view appears
- One-time setup operations
- Cannot handle async/await directly

### `.task()` - Async-Aware View Modifier  
- Handles **asynchronous** operations seamlessly
- Task lifetime tied to view lifecycle
- Automatic cancellation when view disappears
- Support for task priorities
- Built-in memory management

## 🔧 How It Works

The app demonstrates a practical use case where:

1. **Home View**: Simple navigation starting point
2. **Live Facts View**: Streams cat facts every 2 seconds using `.task()`
3. **Automatic Cleanup**: When navigating away, the async task automatically cancels

```swift
.task {
    for await newFact in catFactStream() {
        withAnimation {
            fact = newFact
        }
    }
}
```

## 🏃‍♂️ Running the Project

1. Clone this repository
2. Open `onAppear.xcodeproj` in Xcode
3. Build and run on iOS Simulator or device
4. Navigate to "Show Live Cat Facts" to see `.task()` in action

## 📚 Key Takeaways

- Use `.onAppear()` for simple, synchronous setup tasks
- Use `.task()` for async operations, network requests, and long-running processes
- `.task()` provides better resource management and automatic cleanup
- Task priorities help optimize performance in complex apps

## 🔗 Learn More

Read the full article: [Understanding When to Use .task() vs .onAppear in SwiftUI](https://clementlumumba.substack.com/p/understanding-when-to-use-task-vs)

## 📱 Requirements

- iOS 15.0+
- Xcode 13.0+
- Swift 5.5+

---

*This project demonstrates modern SwiftUI patterns and Swift concurrency features for educational purposes.*