/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct AccountItem: View {
    let account: Account
    let iconSize: CGFloat = 80
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
              AccountIcon(account: account, width: iconSize, height: iconSize)
        Text("Add")
          .font(SpaceGrotesk.medium(size: 12))
          .foregroundColor(Rewards.theme.secondaryTextColor)
          .padding(.top, 10)
        Text(account.accountCommon.name.toString())
          .font(SpaceGrotesk.medium(size: 12))
          .foregroundColor(Rewards.theme.secondaryTextColor)
        }
    }
}

