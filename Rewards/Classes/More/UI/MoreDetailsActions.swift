/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */


import SwiftUI

struct MoreDetailsActions: View {
    var body: some View {
        VStack(spacing: 0){
            Color.tikiDarkGray.frame(height: 4 / UIScreen.main.scale)
            HStack() {
                Text("Report an issue").font(SpaceGrotesk.medium(size: 16)).foregroundColor(.tikiDarkGray)
                Spacer()
                TikiImages.grayAlert.resizable().frame(width: 18, height: 18)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
            Color.tikiDarkGray.frame(height: 4 / UIScreen.main.scale)
            HStack() {
                Text("Data licensing agreement").font(SpaceGrotesk.medium(size: 16)).foregroundColor(.tikiDarkGray)
                Spacer()
                TikiImages.handStop.resizable().frame(width: 18, height: 18)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
            Color.tikiDarkGray.frame(height: 4 / UIScreen.main.scale)
            HStack() {
                Text("Opt out of cashback connections").font(SpaceGrotesk.medium(size: 16)).foregroundColor(.tikiRed)
                Spacer()
                TikiImages.redStop.resizable().frame(width: 18, height: 18)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
        }
    }
}
