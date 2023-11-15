//
//  MoreDetailsData.swift
//  Rewards
//
//  Created by Ricardo on 15/11/23.
//

import SwiftUI

struct MoreDetailsData: View {
    var body: some View {
        Text("What data do we collect?").font(SpaceGrotesk.bold(size: 18)).foregroundColor(.tikiDarkGray)
        Text("Learn about how your data powers your cashback connections").font(SpaceGrotesk.medium(size: 12)).foregroundColor(.tikiDarkGray).multilineTextAlignment(.center)
        HStack() {
            TikiImages.purchases.resizable().frame(width: 18, height: 18)
            Text("Purchases").font(SpaceGrotesk
                .medium(size: 16)).foregroundColor(.tikiDarkGray)
        }
        HStack() {
            TikiImages.receipts.resizable().frame(width: 18, height: 18)
            Text("Receipts").font(SpaceGrotesk
                .medium(size: 16)).foregroundColor(.tikiDarkGray)
        }
        HStack() {
            TikiImages.userId.resizable().frame(width: 18, height: 18)
            Text("User ID").font(SpaceGrotesk
                .medium(size: 16)).foregroundColor(.tikiDarkGray)
        }
    }
}

