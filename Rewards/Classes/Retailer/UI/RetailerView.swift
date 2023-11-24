/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct RetailerView: View{
    let provider: AccountProvider
    var account: Account? = nil
    @Binding var showAccountSheet: Bool
    
    init(provider: AccountProvider, account: Account? = nil, showAccountSheet: Binding<Bool>) {
        self.provider = provider
        self.account = account
        self._showAccountSheet = showAccountSheet
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 0){
            RetailerCard(provider: provider)
                .padding(.top, 28)
            HStack(){
                Text("Account").font(Rewards.theme.fontBold(size: 28))
                Spacer()
            }
            .padding(.vertical, 24)
            if(account == nil) {
                AccountLogin(provider: provider)
            }else{
                AccountView(acc: account!)
            }
            RetailerScan()
                .padding(.top, 32)
            RetailerOffers(provider)
                .padding(.top, 30)
        }.asScreen(title: provider.name(), action: {showAccountSheet = false})
    }
}

