/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct MoreView: View{
    public var accountsList: [Account] = {
        var acc = [Account]()
        for account in AccountEnum.allCases {
            acc.append(Account.init(accountCommon: .init(name: account, type: .RETAILER), status:  .verfied, username: "Username"))
        }
        return acc
    }()
    
    private var gridItemLayout = Array(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    
    public var body: some View {
        ScrollView() {
            VStack(alignment: .leading){
                Spacer()
                ScreenHeader(title: "BACK")
                Text("Monthly Estimate").font(SpaceGrotesk.bold(size: 28)).padding(.leading, 21)
                MoreProgressView().padding()
                Text("Estimate calculated based on your spending history and available offers from eligible retailers.").font(SpaceGrotesk.medium(size: 14)).foregroundColor(Color.tikiDarkGray).padding(.horizontal, 21)
                Text("Accounts").font(SpaceGrotesk.bold(size: 28)).padding(.horizontal, 21).padding(.top, 24)
                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                    ForEach(accountsList, id: \.accountCommon.name){ acc in
                        VStack() {
                            AccountIcon(provider: acc, width: 77, height: 77).padding(.bottom, -15)
                            Text(acc.accountCommon.name.toString()).font(SpaceGrotesk.medium(size: 12)).foregroundColor(.tikiDarkGray)
                        }


                    }
                }.padding(.vertical, 24).overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(Color.tikiDarkGray)).padding(.horizontal, 21)
                MoreDetails()
                Spacer()
                
            }
        }.background(.white)
    }
}
