/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct RetailerCard: View {
    
    let account: Account
    let cashbackPercentage: Int
    
    var body: some View {
        VStack(){
            ZStack(){
                TikiImages.from(account.accountCommon.name.toString())
                    .resizable()
                    .frame(
                        width: 100,
                        height: 100
                    ).clipShape(
                        RoundedRectangle(
                            cornerRadius: 10
                        )
                    ).foregroundColor(.white).shadow(color: .tikiLightGray, radius: 0, x: 4, y: 4)
            }.frame(width: 100, height: 100).background(.white)
            HStack() {
                Spacer()
                Text(account.accountCommon.name.toString())
                    .font(SpaceGrotesk.bold(size: 32))
                Spacer()
            }.padding(.vertical, 16)
            HStack() {
                Text("\(cashbackPercentage)% cashback on all purchases")
                    .font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(.tikiDarkGray)
            }
            .padding(.horizontal, 24)
            .multilineTextAlignment(.center)
        }.padding(.vertical, 24).asCard()
    }
}
