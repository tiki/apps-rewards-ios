/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */


import SwiftUI
import TikiRewards

@main
struct RewardsExampleApp: App {
    
    init(){
        Rewards.config(tikiPublishingID: "", microblinkLicenseKey: "", productIntelligenceKey: "", terms: "Test without an terms")
    }
    
    var body: some Scene {
        WindowGroup {
            Button(action: {
                Rewards.start(userId: "")
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
