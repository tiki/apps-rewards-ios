/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI
import Foundation

public struct AccountIcon : View {
    public var account: Account
    public var width: CGFloat?
    public var height: CGFloat?

    public var body: some View {
        ZStack() {
            TikiImages.from(account.accountCommon.name.rawValue)
                .resizable()
                .frame(width: width, height: height)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: Rewards.theme.secondaryBackgroundColor, radius: 0, x: 2, y: 2)
            if(Account.iconStatus(status: account.status) != nil) {
                Account.iconStatus(status: account.status)!
                    .resizable()
                    .frame(width: 32, height: 32)
            }
            
        }
    }
}
