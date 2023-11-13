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
            .padding(.leading, 21).padding(.top, 24)
            if(!logged) {
                RetailerLogin()
            }else{
                AccountView(acc: account)
            }
            RetailerScan()
            RetailerOffers(account: account)
        }.background(.white)
    }
}

