/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */


import SwiftUI
import Rewards

@main
struct RewardsExampleApp: App {
    var body: some Scene {
        WindowGroup {
            Button(action: {
                Rewards.start(Theme(
                    primaryTextColor: <#T##Color#>,
                    secondaryTextColor: <#T##Color#>,
                    primaryBackgroundColor: <#T##Color#>,
                    secondaryBackgroundColor: <#T##Color#>,
                    accentColor: <#T##Color#>,
                    fontFamily: <#T##String#>))
            }) {
                HStack (spacing: 5) {
                    Image(systemName: "hand.tap.fill")
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                    Text("Click to open Tiki BottomSheet")
                        .font(.system(size: 20, weight: .regular, design: .rounded)).clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}
