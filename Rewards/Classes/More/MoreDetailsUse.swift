//
//  MoreDetailsUse.swift
//  Rewards
//
//  Created by Ricardo on 15/11/23.
//

import SwiftUI

struct MoreDetailsUse: View {
    var body: some View {
        Text("How is that data used?").font(SpaceGrotesk.bold(size: 18)).foregroundColor(.tikiDarkGray)
        HStack() {
            TikiImages.dollar.resizable().frame(width: 18, height: 18)
            Text("Find cashback rewards").font(SpaceGrotesk
                .medium(size: 16)).foregroundColor(.tikiDarkGray)
        }
        HStack() {
            TikiImages.discount.resizable().frame(width: 18, height: 18)
            Text("Relevant ads and offers").font(SpaceGrotesk
                .medium(size: 16)).foregroundColor(.tikiDarkGray)
        }
        HStack() {
            TikiImages.graphic.resizable().frame(width: 18, height: 18)
            Text("Create shopper insights").font(SpaceGrotesk
                .medium(size: 16)).foregroundColor(.tikiDarkGray)
        }
    }
}

