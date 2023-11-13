/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI

public struct MoreProgressView: View {
    @State var progressTop3: Double = 0.25
    @State var progressTop2: Double = 0.65
    @State var progressTop1: Double = 0.80
    @State var nameTop3: String = "Walmart"
    @State var nameTop2: String = "Kroger"
    @State var nameTop1: String = "Dollar General"
    
    public init(){
        let _ = Font.registerSpaceGrotesk()
    }
    
    public var body: some View {
        HStack() {
            Spacer()
            VStack(alignment: .leading){
                Text("Largest Contributors").font(SpaceGrotesk.bold(size: 14))
                    .foregroundColor(Color.tikiGreen)
                Text("\(nameTop1): \(Int(progressTop1*100))%").font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(Color.tikiDarkGray)
                Text("\(nameTop2): \(Int(progressTop2*100))%").font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(Color.tikiDarkGray)
                Text("\(nameTop3): \(Int(progressTop3*100))%").font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(Color.tikiDarkGray)
            }
            Spacer()
            CircularProgressView(progress: progressTop3, progress2: progressTop2, progress3: progressTop1).frame(width: 100, height: 100)
            Spacer()
        }.padding(.horizontal, 21).padding(.vertical, 48).frame(maxWidth: .infinity).asCard()
    }
}

