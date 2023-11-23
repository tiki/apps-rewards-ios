/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct MoreView: View{
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Monthly Estimate")
                .font(Rewards.theme.fontBold(size: 28))
                .padding(.top, 34)
            MoreCard()
                .padding(.top, 16)
            Text("Estimate calculated based on your spending history and available offers from eligible retailers.")
                .font(Rewards.theme.fontMedium(size: 14))
                .foregroundColor(Rewards.theme.secondaryTextColor)
                .padding(.top, 16)
            MoreAccounts()
                .padding(.top, 24)
            MoreDetails()
                .padding(.top, 30)
        }.asScreen(title: "BACK")
    }
}
