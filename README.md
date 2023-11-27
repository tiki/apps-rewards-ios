# TIKI Rewards App

The TIKI Rewards App is a low code solution for integrating reward functionalities into your iOS applications in exchange of user data licensing. 

This SDK provides easy-to-use classes and functions to enhance your app with features like theming, account management, data capture, and licensing.

## Features

- **Theming:** Customize the visual appearance of the UIs to match your app using the `Theme` class.
- **Account Management:** Manage user 3rd party user accounts with the `AccountService` class.
- **Data Capture:** Utilize the `CaptureService` class to capture and process user data.
- **Licensing:** Implement data licensing functionalities in the [TIKI Data Licensing Infrastructure](https://mytiki.com) with the `LicenseService` class.

## Usage
1. Initialize the rewards system using the Rewards class.

The Rewards class is the main API to interact with the TIKI Rewards program. It works as a singleton and initializes services for theming, 3rd party account management, data capture, and data license handling.

```swift
// Start rewards system with default theme
Rewards.start()

// Start rewards system with a custom theme
Rewards.start(Theme(
    primaryTextColor: .yourColor,
    secondaryTextColor: .yourColor,
    primaryBackgroundColor: .yourColor,
    secondaryBackgroundColor: .yourColor,
    accentColor: .yourColor,
    fontFamily: "YourFontFamily"
))
```

And that's it! The Rewards SDK will handle all the steps to license, capture, and publish user data, including user compensation for sharing their data.