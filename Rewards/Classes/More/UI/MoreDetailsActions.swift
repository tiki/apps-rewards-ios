/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct MoreDetailsActions: View {
    @Binding var showTerms: Bool
    @Binding var showMoreSheet: Bool
    let onLicenseAccepted: () -> Void
    let onLicenseDeclined: () -> Void

    var body: some View {
        VStack(spacing: 0){
            Rewards.theme.secondaryTextColor.frame(height: 4 / UIScreen.main.scale)
            HStack() {
                Text("Report an issue").font(Rewards.theme.fontMedium(size: 16)).foregroundColor(Rewards.theme.secondaryTextColor)
                Spacer()
                TikiImages.grayAlert.resizable().frame(width: 18, height: 18)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
            Rewards.theme.secondaryTextColor.frame(height: 4 / UIScreen.main.scale)
            HStack() {
                Text("Data licensing agreement").font(Rewards.theme.fontMedium(size: 16)).foregroundColor(Rewards.theme.secondaryTextColor)
                Spacer()
                TikiImages.handStop.resizable().frame(width: 18, height: 18)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
            Rewards.theme.secondaryTextColor.frame(height: 4 / UIScreen.main.scale)
            HStack() {
                Text("Opt out of cashback connections").font(Rewards.theme.fontMedium(size: 16)).foregroundColor(.tikiRed)
                Spacer()
                TikiImages.redStop.resizable().frame(width: 18, height: 18)
            }
            .padding(.vertical, 16)
            .padding(.horizontal, 12)
        }
    }
}
