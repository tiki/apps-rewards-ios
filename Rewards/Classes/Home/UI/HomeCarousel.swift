/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct HomeCarousel : View {
    
    let accountsList: [AccountEnum];
    let onAccountSelect: (AccountEnum) ->  Void

    public var body: some View {
        ScrollView (.horizontal, showsIndicators: false){
            HStack(spacing: 20) {
                ForEach(accountsList, id: \.rawValue){ acc in
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                        AccountIcon(accountEnum: acc, accountStatus: .notLinked, width: 77, height: 77)
                        Text("Add")
                          .font(Rewards.theme.fontMedium(size: 12))
                          .foregroundColor(Rewards.theme.secondaryTextColor)
                        Text(acc.toString())
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
