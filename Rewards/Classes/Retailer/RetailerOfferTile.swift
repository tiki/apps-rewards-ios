/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct RetailerOfferTile: View {
    
    let offer: RetailerOffer
    
    var body: some View {
        HStack(){
            AccountIcon(account: offer.account, width: 56, height: 56)
            VStack(alignment: .leading){
                Text(offer.title).font(SpaceGrotesk.medium(size: 15)).foregroundStyle(Color.tikiDarkGray)
            }
            Spacer()
            TikiImages.arrow_right
                .resizable()
                .frame(width: 36, height: 36)
                .padding(.trailing, 29)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.leading, 21)
        .padding(.bottom, 24)
    }
}
