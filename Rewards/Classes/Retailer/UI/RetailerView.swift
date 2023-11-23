/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct RetailerView: View{
    @State var logged: Bool = true
    public var cashbackPercentage: Int = 3
    public var account = Account(accountCommon: .init(name: .Walmart, type: .RETAILER), status: .verfied, username: "Username Walmart")
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0){
            RetailerCard(account: account, cashbackPercentage: 3)
                .padding(.top, 28)
            HStack(){
                Text("Account").font(Rewards.theme.fontBold(size: 28))
                Spacer()
            }
            .padding(.vertical, 24)
            if(!logged) {
                AccountLogin()
            }else{
                AccountView(acc: account)
            }
            RetailerScan(logged: $logged)
                .padding(.top, 32)
            RetailerOffers(account.accountCommon.name)
                .padding(.top, 30)
        }.asScreen(title: account.accountCommon.name.toString())
    }
}

