/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct EmailCard: View {
    var body: some View {
        VStack(){
            ZStack(){
                Rectangle().frame(width: 100, height: 100).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.white).shadow(color: .tikiLightGray, radius: 0, x: 4, y: 4)
                TikiImages.gmail.resizable().frame(width: 100, height: 75.86)
            }.frame(width: 100, height: 100).background(.white).padding(.top, 24)
            HStack() {
                Spacer()
                Text("Gmail").font(SpaceGrotesk.bold(size: 32))
                Spacer()
            }.padding(.vertical, 16)
            HStack() {
                Text("When you connect your Gmail account, we auto-identify receipts and process available cashback rewards").font(SpaceGrotesk.medium(size: 14)).foregroundColor(.tikiDarkGray)
            }.padding(.horizontal, 24).padding(.bottom, 24).multilineTextAlignment(.center)
        }.asCard()
    }
}
