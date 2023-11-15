/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct MoreView: View{
    
    public var body: some View {
        ScrollView() {
            VStack(alignment: .leading, spacing: 0){
                ScreenHeader(title: "BACK")
                Text("Monthly Estimate")
                    .font(SpaceGrotesk.bold(size: 28))
                    .padding(.top, 34)
                MoreCard()
                    .padding(.top, 16)
                Text("Estimate calculated based on your spending history and available offers from eligible retailers.")
                    .font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(Color.tikiDarkGray)
                    .padding(.top, 16)
                MoreAccounts()
                    .padding(.top, 24)
                MoreDetails()
                    .padding(.top, 24)
            }
            .padding(.horizontal, 21)
            .padding(.bottom, 56)
        }.background(.white)
    }
}
