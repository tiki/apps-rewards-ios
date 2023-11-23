/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */


import SwiftUI

struct EmailAccounts: View {
    
    @State public var accountsList = [Account(accountCommon: AccountCommon.init(name: .Gmail, type: .EMAIL), status: .sync, username: "dsdsadsadsadsadsadsa@mytiki.com"), Account(accountCommon: AccountCommon.init(name: .Gmail, type: .EMAIL), status: .unverify, username: "mytiki2@mytiki.com")]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("Accounts").font(Rewards.theme.fontBold(size: 28))
                .padding(.top, 24)
            ForEach(accountsList, id: \.hashValue){ acc in
                AccountView(acc: acc)
                    .padding(.top, 24)
            }
        }
    }
}
