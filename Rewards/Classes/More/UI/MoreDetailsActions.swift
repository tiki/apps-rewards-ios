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
            Button(action: {
                UIApplication.shared.open(URL(string: "http://www.mytiki.com")!)
            }, label:
                {
                HStack() {
                    Text("Report an issue").font(SpaceGrotesk.medium(size: 16)).foregroundColor(Rewards.theme.secondaryTextColor)
                    Spacer()
                    TikiImages.grayAlert.resizable().frame(width: 18, height: 18)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 12)
            })
            Rewards.theme.secondaryTextColor.frame(height: 4 / UIScreen.main.scale)
            Button(action: {
                showTerms = true
            }, label:
                { 
                HStack() {
                    Text("Data licensing agreement").font(SpaceGrotesk.medium(size: 16)).foregroundColor(Rewards.theme.secondaryTextColor)
                    Spacer()
                    TikiImages.handStop.resizable().frame(width: 18, height: 18)
                }.padding(.vertical, 16)
                 .padding(.horizontal, 12)
            })
            Rewards.theme.secondaryTextColor.frame(height: 4 / UIScreen.main.scale)
            Button(action: {
                onLicenseDeclined()
//                showSheet = false
            }, label: {
                HStack() {
                    Text("Opt out of cashback connections").font(SpaceGrotesk.medium(size: 16)).foregroundColor(.tikiRed)
                    Spacer()
                    TikiImages.redStop.resizable().frame(width: 18, height: 18)
                }
                .padding(.vertical, 16)
                .padding(.horizontal, 12)
            })

        }
    }
}
