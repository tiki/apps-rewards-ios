//
//  AccountItem.swift
//  Rewards
//
//  Created by Ricardo on 15/11/23.
//

import SwiftUI

struct AccountItem: View {
    let account: Account
    
    var body: some View {
        VStack(
          alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
              AccountIcon(account: account, width: 77, height: 77)
              .padding(.bottom, -15)
        Text("Add")
          .font(SpaceGrotesk.medium(size: 12))
          .foregroundColor(.tikiDarkGray)
              Text(account.accountCommon.name.toString())
          .font(SpaceGrotesk.medium(size: 12))
          .foregroundColor(.tikiDarkGray)
        }
    }
}

