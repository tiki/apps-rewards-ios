# TIKI Rewards App

The TIKI Rewards App is a low code solution for integrating reward functionalities into your iOS applications in exchange of user data licensing and Card Linked Offer Cashback Connections.

This SDK provides easy-to-use classes and functions to enhance your app with features like theming, account management, data capture, and licensing.

## Features
- **Card Linked Offers** Exclusive offers from our partners to end users.
- **Cashback Connections** Automatic activation of cashback eligible transactions.
- **Receipt data extraction** Extraction of detailed anonymous receipt data, including SKU-level transaction data.
- **Licensing:** Implement data licensing functionalities in the [TIKI Data Licensing Infrastructure](https://mytiki.com) with the `LicenseService` class.
- **Theming:** Customize the visual appearance of the UIs to match your app.

## Getting Started

**Prerequisites**
Before getting started, ensure your iOS project meets the following requirements:

- Deployment target version should be iOS 15.0 or later.
- Swift 5.5 or later.
- Cocoapods

**Project Dependencies**
To handle receipt data scraping and data license, we use the [Capture Receipt]() SDK. This SDK uses the [Microblink]() libraries to scan physical and digital receipts and the [TIKI SDK]() to handle data licensing.


### 1. Add Microblink source in the top of your `Podfile`
```
source 'https://github.com/BlinkReceipt/PodSpecRepo.git'
source 'https://cdn.cocoapods.org/'
```

### 2. Add the project dependencies
```
target <YOUR TARGET> do
  use_frameworks!

  # ... other project dependencies

  pod 'BlinkReceipt', '~> 1.27' 
  pod 'BlinkEReceipt', '~> 2.0'  
  pod 'TikiSdkDebug', '~> 3.0.0', :configurations => 'Debug'
  pod 'TikiSdkRelease', '~> 3.0.0', :configurations => 'Release'
  
  pod 'CaptureReceipt', '~> 0.1.0'

end
```

### 3. Configure the company details.
The company details will be used to create the legal terms for data licensing between the company and the end user.
```swift
  Rewards.company(
        name: "Company Inc.",
        jurisdiction: "Tennessee, USA",
        privacy: "https://your-co.com/privacy",
        terms: "https://your-co.com/terms",
  )
```

### 4. Configure the APIs licensing.
```swift
  Rewards.licenses(
    tikiPublishingID: "YOUR TIKI PUBLISHING ID",
    microblinkLicenseKey: "YOUR MICROBLINK ANDROID LICENSE KEY",
    productIntelligenceKey: "YOUR MICROBLINK IOS LICENSE KEY",
  )
```

### 5. Add Camera usage description (required for physical receipts scan)
In order to use the camera in iOS, the app must provide the a message that tells the user why the app is requesting access to the device’s camera. This is done by setting up the `NSCameraUsageDescription` in the `info.plist`.

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
... other existing values
	<key>NSCameraUsageDescription</key>
	<string>The camera is used to scan physical receipts</string>
</dict>
</plist>
```

It can be set in XCode too, with the `Privacy - Camera Usage Description` key in `info.plist` editor.

### 6. Optional - Use Gmail/Outlook APIs 

IMAP is the default method for email scraping. For an enhanced user experience and improved accuracy, we recommend the activation of OAuth through the [Gmail API](https://developers.google.com/gmail/api) and [Outlook API](https://docs.microsoft.com/en-us/outlook/rest/overview) for email scraping. The utilization of these APIs is optional, and you have the flexibility to choose either one, or both.

```swift
  Rewards.oauth(
    gmailAPIKey: "YOUR GMAIL API KEY", // optional
    outlookAPIKey: "YOUR OUTLOOK API KEY" // optional
  )
```

### 7. Optional - Configure a custom Theme
The app can be configured to use your brand colors and font.

```swift
  Rewards.theme(
    primaryTextColor: .yourColor,
    secondaryTextColor: .yourColor,
    primaryBackgroundColor: .yourColor,
    secondaryBackgroundColor: .yourColor,
    accentColor: .yourColor,
    fontFamily: "YourFontFamily"
  )
```

### 8. Alternative - Use the Rewards.config method.
The `Rewards.config` method can be used to simplify the declation of all config details in one call. 

```swift
  Rewards.config(
        companyName: "Company Inc.",
        companyJurisdiction: "Tennessee, USA",
        privacy: "https://your-co.com/privacy",
        terms: "https://your-co.com/terms",
        tikiPublishingID: "YOUR TIKI PUBLISHING ID",
        microblinkLicenseKey: "YOUR MICROBLINK ANDROID LICENSE KEY",
        productIntelligenceKey: "YOUR MICROBLINK IOS LICENSE KEY",
        gmailAPIKey: "YOUR GMAIL API KEY", // optional
        outlookAPIKey: "YOUR OUTLOOK API KEY" // optional
        primaryTextColor: .yourColor, // optional
        secondaryTextColor: .yourColor, // optional
        primaryBackgroundColor: .yourColor, // optional
        secondaryBackgroundColor: .yourColor, // optional
        accentColor: .yourColor, // optional
        fontFamily: "YourFontFamily" // optional
    )
```

## Usage
### 1. Initialize

The Rewards class is the main API to interact with the TIKI Rewards program. It works as a singleton and initializes services for theming, data capture and licensing and rewards administration.

The `initialize` method takes a required `userId` as parameter, that should be your user's unique identification.

```swift
let userId = "YOUR USER'S UNIQUE IDENTIFICATION"
Rewards.initialize(userId)
```

If you need to change the user, i.e. the current user logs out and another one logs in, call the `initialize` method again witha differetn userId.

```swift
let userId = "USER123"
Rewards.initialize(userId)

// not required but recommended
Rewards.logout()

// initialize with another user
let newUserId = "USER456"
Rewards.initialize(newUserId)
```

### 2. Start the app
Whenever you want to show the Rewards app, call the `Rewards.show()` method. 

If the user does not have a valid license agreement, it means it did not accept to join the program yet. 
It will be prompted to accept the license terms and a digital license will be created. The user will be redirected to the home screen afterwards.

If the user already accepted to join the program the home screen will be shown.

And that's it! The Rewards app will prompt the user will handle all the steps to license, capture, and publish user data, including user compensation for sharing their data.

### 3. Handle the user cards
**Add one card**
```swift
  let card = Card(
    last4: "1234", // Last 4 digits of credit card number
    bin: "789564", // Must be a valid BIN of 6 digits, If over 6 digits, send first 6
    issuer: "TIKICard", // Issuer name
    network: .VISA, // CardNetwork Enum
  )
  Rewards.card(card)
```

**Add multiple cards**
```swift
  let card1 = Card(
    last4: "1234", // Last 4 digits of credit card number
    bin: "789564", // Must be a valid BIN of 6 digits, If over 6 digits, send first 6
    issuer: "TIKICard", // Issuer name
    network: .VISA, // CardNetwork Enum
  )
  let card2 = Card(
    last4: "9999", // Last 4 digits of credit card number
    bin: "789123", // Must be a valid BIN of 6 digits, If over 6 digits, send first 6
    issuer: "TIKIBank", // Issuer name
    network: .MATERCARD, // CardNetwork Enum
  )
  let card2 = Card(
    last4: "5555", // Last 4 digits of credit card number
    bin: "675456", // Must be a valid BIN of 6 digits, If over 6 digits, send first 6
    issuer: "TIKIInc", // Issuer name
    network: .AMERICAN, // CardNetwork Enum
  )
  Rewards.cards(card1, card2, card3) // ... varidic parameters
  // or
  let cards = [card1, card2, card3]
  Rewards.cards(cards) // Array
```

**Get user cards**
```swift
  let cards = Rewards.cards()
  // cards content:
  // [
  //  Card(
  //   last4: "1234",
  //   bin: "789564",
  //   issuer: "TIKICard",
  //   network: .VISA,
  //  ),
  //  Card(
  //   last4: "9999",
  //   bin: "789123",
  //   issuer: "TIKIBank",
  //   network: .MATERCARD,
  //  ),
  //  Card(
  //   last4: "5555",
  //   bin: "675456",
  //   issuer: "TIKIInc",
  //   network: .AMERICAN,
  //  )
  // ]
```
**Remove a card**
```swift  
  Rewards.removeCard(
    Card(
     last4: "1234",
     bin: "789564",
     issuer: "TIKICard",
     network: .VISA,
    ),
  )
```

## Example

While this README is helpful, it's always easier to just see it in action. In `/Example` there is simple demo app. On launch, it generates a new random user id, with a button called start. 

- Check out `Example/Rewards/RewardsExampleApp.swift` to view an example configuration of the library.

**Steps to run**
1. cd Example
2. pod install
3. open `Example/Rewards.xcworkspace` in XCode.

## Open Issues
You can find active issues here in GitHub under [Issues](https://github.com/tiki/apps-rewards-ios/issues). If you run into a bug or have a question, just create a new Issue or reach out to a team member on 👾 [Discord](https://discord.gg/tiki).

# Contributing

- Use [GitHub Issues](https://github.com/tiki/apps-rewards-ios/issues) to report any bugs you find or to request enhancements.
- If you'd like to get in touch with our team or other active contributors, pop in our 👾 [Discord](https://discord.gg/tiki).
- Please use [conventional commits](https://www.conventionalcommits.org/en/v1.0.0/) if you intend to add code to this project.