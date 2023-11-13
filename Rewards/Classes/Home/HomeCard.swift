/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI

public struct HomeCard: View {
    @State var progress: Double = 0.25
    
    public init(){
        let _ = Font.registerSpaceGrotesk()
    }
    
    public var body: some View {
        HStack() {
            Spacer()
            VStack(alignment: .leading){
                Text("Month").font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(Color.tikiBlack)
                Text("$4.80 / $12.00").font(SpaceGrotesk.bold(size: 18))
                    .foregroundColor(Color.tikiGreen)
                Text("Lifetime").font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(Color.tikiBlack).padding(.top, 6)
                Text("$34.30").font(SpaceGrotesk.bold(size: 18))
                    .foregroundColor(Color.tikiDarkGray)
                Button {
                    progress += 1
                } label: {
                    HStack {
                        Text("Show More")
                            .foregroundColor(Color.tikiGreen)
                            .font(SpaceGrotesk.bold(size: 18))
                            .lineLimit(1)
                    }
                }.padding(.top, 6)
            }
            Spacer()
            CircularProgressView(progress: progress, progress2: nil, progress3: nil )
              .frame(width: 100, height: 100)
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 24)
        .asCard()
        .padding(.all, 24)
    }
}

