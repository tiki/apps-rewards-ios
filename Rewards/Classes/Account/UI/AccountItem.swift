/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct AccountItem: View {
    let accountEnum: AccountEnum
    let accountStatus: AccountStatus
    let iconSize: CGFloat = 80
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0) {
            AccountIcon(accountEnum: accountEnum, accountStatus: accountStatus, width: iconSize, height: iconSize)
        Text("Add")
                .font(Rewards.theme.fontMedium(size: 12))
          .foregroundColor(Rewards.theme.secondaryTextColor)
          .padding(.top, 10)
            Text(accountEnum.toString())
          .font(SpaceGrotesk.medium(size: 12))
          .foregroundColor(Rewards.theme.secondaryTextColor)
        }
    }
}

