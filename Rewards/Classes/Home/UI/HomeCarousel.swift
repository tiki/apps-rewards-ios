/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct HomeCarousel : View {
    
    @Binding var accountsList: [Account];
    let onAccountSelect: (Account) ->  Void

    public var body: some View {
        ScrollView (.horizontal, showsIndicators: false){
            HStack(spacing: 20) {
                ForEach(accountsList, id: \.accountCommon.name){ acc in
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                        AccountIcon(account: acc, width: 77, height: 77)
                        Text("Add")
                          .font(SpaceGrotesk.medium(size: 12))
                          .foregroundColor(Rewards.theme.secondaryTextColor)
                        Text(acc.accountCommon.name.toString())
                          .font(SpaceGrotesk.medium(size: 12))
                          .foregroundColor(Rewards.theme.secondaryTextColor)
                    }.onTapGesture {
                        onAccountSelect(acc)
                    }

                }
            }
        }.frame(width: 390, height: 120)
    }
}
