/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */


import SwiftUI

struct MoreDetailsUse: View {
    var body: some View {
        VStack(spacing: 0){
            Text("How is that data used?").font(SpaceGrotesk.bold(size: 18)).foregroundColor(Rewards.theme.secondaryTextColor)
            HStack() {
                TikiImages.dollar.resizable().frame(width: 18, height: 18)
                Text("Find cashback rewards").font(SpaceGrotesk
                    .medium(size: 16)).foregroundColor(Rewards.theme.secondaryTextColor)
            }.padding(.top, 24)
            HStack() {
                TikiImages.discount.resizable().frame(width: 18, height: 18)
                Text("Relevant ads and offers").font(SpaceGrotesk
                    .medium(size: 16)).foregroundColor(Rewards.theme.secondaryTextColor)
            }.padding(.top, 12)
            HStack() {
                TikiImages.graphic.resizable().frame(width: 18, height: 18)
                Text("Create shopper insights").font(SpaceGrotesk
                    .medium(size: 16)).foregroundColor(Rewards.theme.secondaryTextColor)
            }.padding(.top, 12)
        }
    }
}

