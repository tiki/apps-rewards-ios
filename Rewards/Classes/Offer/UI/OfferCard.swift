/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct OfferCard: View{
    
    var estimate = Rewards.estimate()
    public var body: some View {
        VStack{
            Text("Earn monthly")
                .font(SpaceGrotesk.medium(size: 20))
                .foregroundColor(Rewards.theme.primaryTextColor)
            Text("$\(estimate.min) - $\(estimate.max)")
                .font(SpaceGrotesk.bold(size: 42))
                .foregroundColor(Rewards.theme.accentColor)
            Text("for your shopping habits")
                .font(SpaceGrotesk.medium(size: 20))
                .foregroundColor(Rewards.theme.primaryTextColor)
        }.padding(.vertical, 48).asCard()
    }
    
}
