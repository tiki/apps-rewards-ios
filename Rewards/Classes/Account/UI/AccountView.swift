/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct AccountView: View {
    
    let acc: Account
    
    var body: some View {
        HStack(spacing: 0){
            AccountIcon(account: acc, width: 56, height: 56)
                .padding(.trailing, 24)
            VStack(alignment: .leading, spacing: 0){
                Text(acc.accountCommon.name.toString())
                    .font(SpaceGrotesk.bold(size: 24))
                    .foregroundStyle(acc.status == .unverify ? Color.tikiRed : Color.tikiDarkGray)
                Text(acc.username ?? "username")
                    .font(SpaceGrotesk.medium(size: 20))
                    .foregroundStyle(acc.status == .unverify ? Color.tikiRed : Color.tikiDarkGray)
                    .lineLimit(1)
                    .truncationMode(.tail)
            }
            Spacer()
            Button(action: {print("TODO")}){
                TikiImages.minus
                    .resizable()
                    .frame(width: 36, height: 36)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
    }
}
