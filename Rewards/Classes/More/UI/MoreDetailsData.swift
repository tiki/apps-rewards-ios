/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */


import SwiftUI

struct MoreDetailsData: View {
    var body: some View {
        VStack(spacing: 0){
            Text("What data do we collect?").font(SpaceGrotesk.bold(size: 18))
                .foregroundColor(.tikiDarkGray)
            Text("Learn about how your data powers your cashback connections")
                .font(SpaceGrotesk.medium(size: 12))
                .foregroundColor(.tikiDarkGray)
                .multilineTextAlignment(.center)
            HStack(){
                HStack(){
                    TikiImages.purchases.resizable().frame(width: 18, height: 18)
                    Text("Purchases").font(SpaceGrotesk
                        .medium(size: 16)).foregroundColor(.tikiDarkGray)
                }
                Spacer()
                HStack(){
                    TikiImages.receipts.resizable().frame(width: 18, height: 18)
                    Text("Receipts").font(SpaceGrotesk
                        .medium(size: 16)).foregroundColor(.tikiDarkGray)
                }
            }.padding(.top, 24)
            HStack(){
                HStack(){
                    TikiImages.userId.resizable().frame(width: 18, height: 18)
                    Text("User ID").font(SpaceGrotesk
                        .medium(size: 16)).foregroundColor(.tikiDarkGray)
                }
                Spacer()
            }.padding(.top, 12)
        }.frame(width: 250)
    }
}

