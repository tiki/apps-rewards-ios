//
//  MoreDetailsActions.swift
//  Rewards
//
//  Created by Ricardo on 15/11/23.
//

import SwiftUI

struct MoreDetailsActions: View {
    var body: some View {
        HStack() {
            Text("Report an issue").font(SpaceGrotesk.medium(size: 16)).foregroundColor(.tikiDarkGray)
            TikiImages.grayAlert.resizable().frame(width: 18, height: 18)
        }
        HStack() {
            Text("Data licensing agreement").font(SpaceGrotesk.medium(size: 16)).foregroundColor(.tikiDarkGray)
            Spacer()
            TikiImages.handStop.resizable().frame(width: 18, height: 18)
        }.padding(.horizontal, 12).padding(.vertical, 5)
        HStack() {
            Text("Opt out of cashback connections").font(SpaceGrotesk.medium(size: 16)).foregroundColor(.red)
            Spacer()
            TikiImages.redStop.resizable().frame(width: 18, height: 18)
        }
    }
}
