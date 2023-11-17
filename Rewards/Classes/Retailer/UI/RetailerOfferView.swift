/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct RetailerOffers: View {
    
    let offers: [RetailerOffer]
    
    init(_ provider: AccountEnum){
        self.offers = Rewards.offers(provider: provider)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("More Offers").font(SpaceGrotesk.bold(size: 28))
        }
        ForEach(offers, id: \.description){ offer in
            RetailerOfferTile(offer: offer)
        }
    }
}
