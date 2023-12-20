/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */


import SwiftUI
import TikiRewards

@main
struct RewardsExampleApp: App {
    
    init(){
        Rewards.config(
            companyName: "Company Inc.", companyJurisdiction: "Tennessee, USA", privacy: "https://your-co.com/privacy", terms: "terms for testing",
            tikiPublishingID: "4a03c7fc-1533-48f4-b0e7-c34e49af91cf",
            microblinkLicenseKey: "sRwAAAEaY29tLm15dGlraS5jYXB0dXJlLnJlY2VpcHRuGv//0KdCFBQgFSNOuVduGfcqT3S6jLuPoAoP5bngYkX32/19dPBW2zVYisI6sB8SjLy9dgepoVdIs6sCZZPy7uWIcGKfdSGx8vgrEzd/phAThD+5mfJ6DTn/0eDRoFDn1/siDikIwWpsxJSRkjGBQysdOKmlhTtWHUHeNGwvAVrl6T64+Q==",
            productIntelligenceKey: "wSNX3mu+YGc/2I1DDd0NmrYHS6zS1BQt2geMUH7DDowER43JGeJRUErOHVwU2tz6xHDXia8BuvXQI3j37I0uYw==")
    }
    
    var body: some Scene {
        WindowGroup {
            Button(action: {
                try? Rewards.start(userId: "")
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
