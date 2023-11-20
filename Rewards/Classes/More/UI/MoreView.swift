/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct MoreView: View{
    let onDismiss: () -> Void
    @Binding var showMoreSheet: Bool
    @Binding var showAccountSheet: Bool
    @Binding var account: Account
    @State var showTerms: Bool = false
    @Binding var showSheet: Bool
    let onLicenseAccepted: () -> Void
    let onLicenseDeclined: () -> Void

    
    func onAccountSelected(account: Account) -> Void{
        self.account = account
        self.showAccountSheet = true
    }
    
    public var body: some View {
        ZStack(){
            VStack(alignment: .leading, spacing: 0){
                Text("Monthly Estimate")
                    .font(SpaceGrotesk.bold(size: 28))
                    .padding(.top, 34)
                MoreCard()
                    .padding(.top, 16)
                Text("Estimate calculated based on your spending history and available offers from eligible retailers.")
                    .font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(Rewards.theme.secondaryTextColor)
                    .padding(.top, 16)
                MoreAccounts(onAccountSelect: onAccountSelected)
                    .padding(.top, 24)
                MoreDetails(showTerms: $showTerms, showSheet: $showSheet, showMoreSheet: $showMoreSheet, onDismiss: onDismiss, onLicenseAccepted: onLicenseAccepted, onLicenseDeclined: onLicenseDeclined)
                    .padding(.top, 30)
            }.asScreen(title: "BACK", action: {showMoreSheet = false})
            if(showTerms){
                OfferTerms(showTerms: $showTerms, onLicenseAccepted: onDismiss).transition(.navigate)
            }
        }
    }
}
