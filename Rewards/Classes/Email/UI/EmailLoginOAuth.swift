/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct EmailLoginOAuth: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            TikiImages.google
                .resizable()
                .frame(height: 70)
                .onTapGesture {
                    print("google oauth login")
                }.padding(.top, 22)
            HStack(){
                VStack{
                    Divider()
                        .frame(height: 1)
                        .overlay(Rewards.theme.secondaryTextColor)
                }
                Text("or").font(SpaceGrotesk.regular(size: 14))
                    .padding(.horizontal, 14)
                VStack{
                    Divider().frame(height: 1)
                        .overlay(Rewards.theme.secondaryTextColor)
                }
            }.padding(.top, 32)
        }
    }
}
