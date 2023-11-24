/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct EmailView: View{
    
    let provider: AccountProvider
    let onAccount: (Account) -> Void
    @State var accounts: [Account] = []
    @Binding var showAccountSheet: Bool
    
    
    init(provider: AccountProvider, showAccountSheet: Binding<Bool>, onAccount: @escaping (Account) -> Void) {
        self.provider = provider
        self._showAccountSheet = showAccountSheet
        self.accounts = Rewards.account.accounts(for: provider)
        self.onAccount = onAccount
    }
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0){
            EmailCard()
                .padding(.top, 28)
            EmailAccounts(accounts: $accounts){ removed in
                accounts.removeAll(where: {acc in removed == acc})
            }
            Text("Add Account").font(Rewards.theme.fontBold(size: 28)).padding(.top, 30)
            if(provider == .email(.GMAIL)){
                EmailLoginOAuth().padding(.top, 24)
            }
            AccountLogin(provider: provider){ account in
                accounts.append(account)
            }
                .padding(.top, 32)
        }.asScreen(title: provider.name(), action: {showAccountSheet = false})
    }
}


