/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct HomeView: View {
    
    let onDismiss: () -> Void
    let onLicenseDeclined: () -> Void
    @State var showSheet: Bool = true
    @State var offset: CGFloat = 0
    @State var accounts: [Account] = initAccounts()
    @State var isOpen: Bool = false
    
    public var body: some View {
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
                    HomeCard()
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
                    HomeCarousel(accountsList: $accounts)
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
