/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI
import CaptureReceipt

public struct RetailerView: View{
    let provider: AccountProvider
    @State var account: Account? = nil
    @Binding var showAccountSheet: Bool
    let onAccount: (Account) -> Void

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
                AccountLogin(provider: provider){ acc in
                    account = acc
                }
            }else{
                AccountRow(acc: account!){ acc in
                    account = nil
                }
            }
            RetailerScan()
                .padding(.top, 32)
            RetailerOffers(provider)
                .padding(.top, 30)
        }.asScreen(title: provider.name(), action: {showAccountSheet = false})
    }
}

