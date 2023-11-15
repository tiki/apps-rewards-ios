/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct HomeView: View {
    
    @State var onDismiss: () -> Void
    @State var showSheet: Bool = true
    @State var offset: CGFloat = 0
    @State var accountsList: [Account] = initAccounts()
    
    public init(_ onDismiss: @escaping () -> Void){
        let _ = Font.registerSpaceGrotesk()
        self.accountsList = initAccounts()
        self.onDismiss = onDismiss
    }
    
    public var body: some View {
        if(showSheet){
            VStack(alignment: .center, spacing: 0) {
                BottomSheetHeader(
                  title: "CASHBACK CONNECTIONS",
                  subtitle: "Share data. Earn cash.",
                  close: {
                    showSheet = false
                    onDismiss()
                  })
                .padding(.horizontal, 24)
                .padding(.top, 20)
                HomeCard()
                    .padding(.top, 48)
                    .padding(.horizontal, 24)
                Text ("Increase Earnings")
                    .font(SpaceGrotesk.medium(size: 16))
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .padding(.horizontal, 24)
                  .padding(.top, 48)
                  .padding(.bottom, 24)
                HomeCarousel(accountsList: $accountsList)
            }.padding(.bottom, 40)
            .transition(.bottomSheet)
            .background(.white)
            .asBottomSheet(
                isShowing: $showSheet,
                offset: $offset,
                onDismiss: {
                    showSheet = false
                }
            )
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
