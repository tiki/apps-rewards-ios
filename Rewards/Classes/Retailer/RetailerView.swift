/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct RetailerView: View{
    @State var logged: Bool = false
    public var cashbackPercentage: Int = 3
    public var account = Account(accountCommon: .init(name: .Walmart, type: .RETAILER), status: .verfied, username: "Username Walmart")
        
    
    public var body: some View {
        ScrollView(.vertical) {
            ScreenHeader(title: account.accountCommon.name.toString())
            RetailerCard(account: account, cashbackPercentage: 3)
            .padding(.horizontal, 21).padding(.top, 24)
            HStack(){
                Text("Account").font(SpaceGrotesk.bold(size: 28))
                Spacer()
            }.padding(.vertical, 24).padding(.horizontal, 24)
            if(!logged) {
                RetailerLogin()
            }else{
                AccountView(acc: account)
            }
            RetailerScan(logged: $logged)
            RetailerOffers(account: account)
        }.background(.white)
    }
}

