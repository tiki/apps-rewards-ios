/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import SwiftUI

struct RetailerOffers: View {
    
    let account: Account
    
    var body: some View {
        HStack(){
            Text("More Offers").font(SpaceGrotesk.bold(size: 28))
            Spacer()
        }.padding(.leading, 21).padding(.bottom, 24)
       
        HStack(){
            AccountIcon(account: account, width: 56, height: 56)
            VStack(alignment: .leading){
                Text("4% cashback on electronics").font(SpaceGrotesk.medium(size: 15)).foregroundStyle(Color.tikiDarkGray)
            }
            Spacer()
            Button(action: {print("TODO")}){
                TikiImages.arrow_right.resizable().frame(width: 36, height: 36).padding(.trailing, 29)
            }
        }.frame(maxWidth: .infinity, alignment: .leading).padding(.leading, 21).padding(.bottom, 24)
    }
}

