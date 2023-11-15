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
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0){
                Text("Month").font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(Color.tikiBlack)
                    .padding(.bottom, 3)
                Text("$4.80 / $12.00").font(SpaceGrotesk.bold(size: 18))
                    .foregroundColor(Color.tikiGreen)
                    .padding(.bottom, 12)
                Text("Lifetime").font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(Color.tikiBlack)
                    .padding(.bottom, 3)
                Text("$34.30").font(SpaceGrotesk.bold(size: 18))
                    .foregroundColor(Color.tikiDarkGray)
                    .padding(.bottom, 12)
                Button {
                    progress += 1
                } label: {
                    HStack(spacing: 0) {
                        Text("Show More")
                            .foregroundColor(Color.tikiGreen)
                            .font(SpaceGrotesk.bold(size: 18))
                            .lineLimit(1)
                    }
                }
            }
            Spacer()
            CircularProgressView(progress: progress, progress2: nil, progress3: nil )
              .frame(width: 80, height: 80)
        }
        .frame(maxWidth: .infinity)
        .padding(.leading, 31)
        .padding(.trailing, 41)
        .padding(.vertical, 24)
        .asCard()
    }
}

