/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */


import SwiftUI

struct EmailAccounts: View {
    
    let provider: AccountProvider
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Accounts").font(Rewards.theme.fontBold(size: 28))
                .padding(.top, 24)
            ForEach(Rewards.account.accounts(for: provider), id: \.hashValue){ acc in
                AccountView(acc: acc)
                    .padding(.top, 24)
            }
        }
    }
}
