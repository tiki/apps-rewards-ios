/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct AccountView: View {
    
    let acc: Account
    
    var body: some View {
        HStack(){
            AccountIcon(account: acc, width: 56, height: 56)
            VStack(alignment: .leading){
                Text(acc.accountCommon.name.toString()).font(SpaceGrotesk.bold(size: 24)).foregroundStyle(Color.tikiDarkGray)
                Text(acc.username ?? "username").font(SpaceGrotesk.medium(size: 20)).foregroundStyle(Color.tikiDarkGray)
            }
            Spacer()
            Button(action: {print("TODO")}){
                TikiImages.minus
                    .resizable()
                    .frame(width: 36, height: 36).padding(.trailing, 29)
            }
        }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 21).padding(.bottom, 24)
    }
}
