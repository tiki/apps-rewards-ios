//
//  MoreAccounts.swift
//  Rewards
//
//  Created by Ricardo on 15/11/23.
//

import SwiftUI

struct MoreAccounts: View {
    public var accountsList: [Account] = {
        var acc = [Account]()
        for account in AccountEnum.allCases {
            acc.append(Account.init(accountCommon: .init(name: account, type: .RETAILER), status:  .verfied, username: "Username"))
        }
        return acc
    }()
    
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    var body: some View {
        Text("Accounts").font(SpaceGrotesk.bold(size: 28)).padding(.horizontal, 21).padding(.top, 24)
        LazyVGrid(columns: gridItemLayout, spacing: 20) {
            ForEach(accountsList, id: \.accountCommon.name){ acc in
                VStack() {
                    AccountIcon(account: acc, width: 77, height: 77)
                    Text(acc.accountCommon.name.toString()).font(SpaceGrotesk.medium(size: 12)).foregroundColor(.tikiDarkGray)
                }


            }
        }.asCard()
    }
}
