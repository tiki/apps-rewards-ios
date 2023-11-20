/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct HomeView: View {
    
    let onDismiss: () -> Void
    let onLicenseDeclined: () -> Void
    let onLicenseAccepted: () -> Void
    @State var showSheet: Bool = true
    @State var showMoreSheet: Bool = false
    @State var showAccountSheet: Bool = false
    @State var offset: CGFloat = 0
    @State var accounts: [Account] = initAccounts()
    @State var account: Account = .init(accountCommon: .init(name: .Gmail, type: .EMAIL), status: .verfied)
    @State var isOpen: Bool = false
    
    func onAccountSelected(account: Account) -> Void{
        self.account = account
        self.showAccountSheet = true
    }
    
    public var body: some View {
        ZStack(){
            if(showSheet){
                VStack(alignment: .center, spacing: 0) {
                    if(!isOpen){
                        BottomSheetHeader(
                            title: "CASHBACK CONNECTIONS",
                            subtitle: "Share data. Earn cash.",
                            close: {
                                showSheet = false
                                onDismiss()
                            })
                        .padding(.horizontal, 24)
                        .padding(.top, 20)
                        HomeCard(showMoreSheet: $showMoreSheet)
                            .padding(.top, 48)
                            .padding(.horizontal, 24)
                    }
                    Text ("Increase Earnings")
                        .padding(.top, isOpen ? 24 : 0)
                        .font(SpaceGrotesk.medium(size: 16))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                        .padding(.top, 48)
                        .padding(.bottom, 24)
                    if(isOpen){
                        HomeAccountGrid(isOpen: $isOpen, accountsList: $accounts)
                    }else{
                        HomeCarousel(accountsList: $accounts, onAccountSelect: onAccountSelected)
                    }
                }
                .padding(.bottom, isOpen ? 0 : 40)
                .transition(.bottomSheet)
                .background(.white)
                .asBottomSheet(
                    isShowing: $showSheet,
                    offset: $offset,
                    onDismiss: {
                        showSheet = false
                        onDismiss()
                    }
                )
                .gesture(DragGesture(minimumDistance: 5, coordinateSpace: .global)
                    .onChanged { value in
                        if(!isOpen){
                            offset = value.translation.height > 0 ? value.translation.height : 0
                        }
                    }
                    .onEnded{ value in
                        if(isOpen){
                            if(value.translation.height > 0){
                                isOpen = false
                            }
                        }else{
                            if(value.translation.height > 0){
                                withAnimation(.easeOut) {
                                    showSheet = false
                                }
                                onDismiss()
                            }else{
                                isOpen = true
                            }
                        }
                    }
                )
            }
            if(showMoreSheet){
                MoreView(onDismiss: onDismiss, showMoreSheet: $showMoreSheet, showAccountSheet: $showAccountSheet, account: $account, showSheet: $showSheet, onLicenseAccepted: onLicenseAccepted, onLicenseDeclined: onLicenseDeclined)
            }
            if(showAccountSheet){
                if(account.accountCommon.type == .EMAIL){
                    EmailView(provider: account.accountCommon.name, showAccountSheet: $showAccountSheet)
                }
                if(account.accountCommon.type == .RETAILER) {
                    RetailerView(logged: true, cashbackPercentage: 3, account: account, showAccountSheet: $showAccountSheet)
                }
            }


        }
    }
}

func initAccounts() -> [Account] {
  var acc = [Account]()
  for account in AccountEnum.allCases {
      acc.append(
        Account.init(accountCommon: 
          .init(name: account, type: .RETAILER), 
          status:  .notLinked, username: "Username"))
  }
  return acc
}
