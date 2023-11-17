/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */


import SwiftUI

struct MoreAccounts: View {
    public var accountsList: [Account] = {
        var acc = [Account]()
        for account in AccountEnum.allCases {
            acc.append(Account.init(accountCommon: .init(name: account, type: .RETAILER), status:  .verfied, username: "Username"))
        }
        acc[3].status = .unverify
        return [acc[0],acc[1],acc[2],acc[3]]
    }()
    
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    var body: some View {
        Text("Accounts").font(SpaceGrotesk.bold(size: 28))
        LazyVGrid(columns: gridItemLayout, spacing: 20) {
            ForEach(accountsList, id: \.accountCommon.name){ acc in
                VStack() {
                    AccountIcon(account: acc, width: 80, height: 80)
                    Text(acc.accountCommon.name.toString()).font(SpaceGrotesk.medium(size: 12)).foregroundColor(Rewards.theme.secondaryTextColor)
                }
            }
        }
        .padding(.vertical, 24)
        .padding(.horizontal, 32)
        .asCard()
    }
}
