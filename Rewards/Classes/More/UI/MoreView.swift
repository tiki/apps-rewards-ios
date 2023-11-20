/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct MoreView: View{
    @Binding var showMoreSheet: Bool
    let onLicenseDeclined: () -> Void
    
    @State var showAccountSheet: Bool = false
    @State var selectedAccount: Account? = nil
    @State var showTerms: Bool = false

    func onAccountSelected(account: Account) -> Void{
        self.selectedAccount = account
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
                MoreDetails(showTerms: $showTerms,  showMoreSheet: $showMoreSheet, onLicenseAccepted: {}, onLicenseDeclined: onLicenseDeclined)
                    .padding(.top, 30)
            }.asScreen(title: "BACK", action: {showMoreSheet = false})
            if(showTerms){
                OfferTerms(showTerms: $showTerms, onLicenseAccepted: {}).transition(.navigate)
            }
        }
    }
}
