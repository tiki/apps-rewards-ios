/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct OfferCard: View{
    
    public var body: some View {
        VStack{
            Text("Earn monthly")
                .font(SpaceGrotesk.medium(size: 20))
                .foregroundColor(.tikiBlack)
            Text("$5 - $15")
                .font(SpaceGrotesk.bold(size: 42))
                .foregroundColor(.tikiGreen)
            Text("for your shopping habits")
                .font(SpaceGrotesk.medium(size: 20))
                .foregroundColor(.tikiBlack)
        }.asCard()
    }
    
}
