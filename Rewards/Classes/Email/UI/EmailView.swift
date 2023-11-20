/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct EmailView: View{
    
    let provider: AccountEnum
    @Binding var showAccountSheet: Bool
    
    public var body: some View {
        VStack(alignment: .leading, spacing: 0){
            EmailCard()
                .padding(.top, 28)
            EmailAccounts()
            Text("Add Account").font(SpaceGrotesk.bold(size: 28)).padding(.top, 30)
            if(provider == .Gmail){
                EmailLoginOAuth().padding(.top, 24)
            }
            AccountLogin(provider: provider).padding(.top, 32)
        }.asScreen(title: provider.toString(), action: {showAccountSheet = false})
    }
}


