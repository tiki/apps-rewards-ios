/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct RetailerCard: View {
    
    let account: Account
    let cashbackPercentage: Int
    
    var body: some View {
        VStack(spacing: 0){
            ZStack(){
                Rectangle()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .foregroundColor(.white)
                    .shadow(color: Rewards.theme.secondaryBackgroundColor, radius: 0, x: 4, y: 4)
                TikiImages.from(account.accountCommon.name.rawValue)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }.frame(width: 100, height: 100).background(.white).padding(.top, 24)
            Text(account.accountCommon.name.toString())
                .font(SpaceGrotesk.bold(size: 32))
                .padding(.top, 16)
            Text("\(cashbackPercentage)% cashback on all purchases")
                .font(SpaceGrotesk.medium(size: 14)).foregroundColor(Rewards.theme.secondaryTextColor)
                .padding(.horizontal, 24)
                .padding(.top, 16)
                .multilineTextAlignment(.center)
        }
        .padding(.bottom, 24)
        .asCard()
    }
}
