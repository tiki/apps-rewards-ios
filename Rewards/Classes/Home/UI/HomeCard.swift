/*
 * Copyright (c) TIKI Inc.
 * MIT license. See LICENSE file in the root directory.
 */

import Foundation
import SwiftUI

public struct HomeCard: View {
    @State var progress: Double = 0.25
    
    public var body: some View {
        HStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0){
                Text("Month").font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(Rewards.theme.primaryTextColor)
                    .padding(.bottom, 3)
                Text("$4.80 / $12.00").font(SpaceGrotesk.bold(size: 18))
                    .foregroundColor(Rewards.theme.accentColor)
                    .padding(.bottom, 12)
                Text("Lifetime").font(SpaceGrotesk.medium(size: 14))
                    .foregroundColor(Rewards.theme.primaryTextColor)
                    .padding(.bottom, 3)
                Text("$34.30").font(SpaceGrotesk.bold(size: 18))
                    .foregroundColor(Rewards.theme.secondaryTextColor)
                    .padding(.bottom, 12)
                Button {
                    progress += 1
                } label: {
                    HStack(spacing: 0) {
                        Text("Show More")
                            .foregroundColor(Rewards.theme.accentColor)
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

