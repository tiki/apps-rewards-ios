/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in root directory.
 */

import SwiftUI

public struct Title: View{
    
    let close: () -> Void
    
    public var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("CASHBACK CONNECTIONS")
                    .font(SpaceGrotesk.bold(size: 22))
                    .foregroundColor(.tikiBlack).frame(maxWidth: .infinity, alignment: .leading)
                Button(action: close) {
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 34, weight: .light, design: .rounded))
                        .foregroundColor(.black)
                }
            }
            .padding(.top, 3)
            Text("Share data. Earn cash.")
                .font(SpaceGrotesk.medium(size: 16))
                .foregroundColor(.tikiDarkGray)
        }
    }
}
