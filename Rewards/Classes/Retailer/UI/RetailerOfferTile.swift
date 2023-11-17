/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct RetailerOfferTile: View {
    
    let offer: RetailerOffer
    
    var body: some View {
        HStack(){
            TikiImages.from(offer.provider.toString())
                .resizable()
                .frame(width: 56, height: 56)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .tikiLightGray, radius: 0, x: 2, y: 2)
                .padding(.trailing, 24)
            Text(offer.description).font(SpaceGrotesk.medium(size: 15)).foregroundStyle(Color.tikiDarkGray).padding(.trailing, 20)
            Spacer()
            TikiImages.arrow_right
                .resizable()
                .frame(width: 36, height: 36)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.bottom, 24)
    }
}
